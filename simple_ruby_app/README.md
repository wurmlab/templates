It downloads sequences in FASTA format from Uniprot.

Use it like this:

    # Prep things.
    gem install bundle
    bundle

    # Fetch and display sequences on the screen.
    bundle exec bin/app spec/uniprot_ids.txt

    # Fetch and write sequences to a file.
    bundle exec bin/app -o sequences.fa spec/uniprot_ids.txt

    # Run tests
    bundle exec rake
