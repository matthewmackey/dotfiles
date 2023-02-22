# To run any of the install scripts in an interactive mode so that we can see
# the output of printf commands, you can run:

bash -i $SCRIPT
bash -i ./install-asdf.sh

# This is a hack though b/c it still loads the entire shell and all the
# includes (which outputs all the printf statements from loading the includes
# which we don't want) which we don't want for running an install scripts
# ad-hoc.
