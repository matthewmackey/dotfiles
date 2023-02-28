#
# aws.bash
#
# See: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
#
if [ -f /usr/local/bin/aws_completer ]; then
  complete -C '/usr/local/bin/aws_completer' aws
fi
