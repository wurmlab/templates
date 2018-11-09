# Copyright 2017 Anurag Priyam, Queen Mary University of London.
#
# Boilerplate code for writing bash scripts that can be run easily via qsub or
# interactively on a fat node (such as frontend 6).


# Echo what is being executed. Exit on first failure. Treat failures in a piped
# statement as failure of the whole statement.
set -exo pipefail

# Make it easy to specify the task to run, and max CPU and RAM to use for the
# task if not running under qsub.
TASK_ID=${TASK_ID:-$SGE_TASK_ID}
RAM=${RAM:-$SGE_HGR_m_mem_free}
CPU=${CPU:-$NSLOTS}

# If RAM was obtained from SGE, it will be in the format: 64.000G. Remove the
# decimal part as some tools, such as qualimap don't like it. We create a
# function to do the processing so as to not litter the environment with
# temporary variables.
function _format_ram()
{
  local str=$1
  local unit=${str: -1}
  local value=${str:0:-1}
  echo ${value/.*}${unit}
}
RAM=$(_format_ram ${RAM})

# Two variables are essential to run the script: an index file that captures
# input parameters for each task, and a TASK_ID specifying which task should
# be run.
if [[ -z "$INDEX" ]] || [[ -z "$TASK_ID" ]]; then
  echo "Please specify INDEX and TASK_ID"
  exit 1
fi

# Read params for the given task from index file. Index file must have at least
# one column that is like a primary key column (like sample id).
params=($(sed -n "${TASK_ID}p" "${INDEX}"))

# SCRATCH is per analysis ./tmp directory. Output of the script for all samples
# (or datasets) are written here. For sample id specific output directory, use
# lowercase scratch (see below).
if [[ -z "${SCRATCH}" ]]; then
  SCRATCH=./tmp
fi
# Place sample (or dataset) specific output in a subdirectory in SCRATCH.
scratch="$SCRATCH/${params[0]}"

# Make it illegal to use unset variables. The code above is exempt from
# this check. Downstream scripts can undo this behaviour with `set +u`.
set -u
