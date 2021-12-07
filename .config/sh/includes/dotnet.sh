#
# dotnet.sh
#

#------------------------------------------------------------------------------------------------
# Microsoft .NET
#------------------------------------------------------------------------------------------------
# From: dotnet-sdk-3.1 APT package install:
#
# The .NET Core tools collect usage data in order to help us improve your
# experience. The data is anonymous and doesn't include command-line arguments.
# The data is collected by Microsoft and shared with the community. You can
# opt-out of telemetry by setting the DOTNET_CLI_TELEMETRY_OPTOUT environment
# variable to '1' or 'true' using your favorite shell.",
export DOTNET_CLI_TELEMETRY_OPTOUT=true
