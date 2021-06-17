MAVEN_HOME=/opt/maven
if [[ -d "$MAVEN_HOME" ]]; then
  export MAVEN_HOME
  export MAVEN_OPTS="-Xms1024m -Xmx2048m"
  export PATH="$MAVEN_HOME/bin:$PATH"
fi
