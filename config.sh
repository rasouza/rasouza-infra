# User configuration.
#
# This file should contain the product-specific configuration.
# For example, one may overwrite default global configuration
# values such as ROOT_ONLY.
# Plus, one should define the three greeter functions 'welcome',
# 'installation_complete', and 'installation_incomplete'.

# Set to 1 to enforce root installations.
# ROOT_ONLY=1

# Overwrite to disable the initial touch-all-files.
#INITIAL_TOUCH_ALL=1

# Overwrite to disable task dependency checking.
#TASK_DEPENDENCY_CHECKING=1

# Overwrite default utils & tasks directories.
#UTILS_DIR=${INSTALLER_PATH}/data/utils
#TASKS_DIR=${INSTALLER_PATH}/data/tasks

# Overwrite default log-to-stdout config.
#LOG_STDOUT=( "ERROR" "IMPORTANT" "WARNING" "INFO" "SKIP" "START" "FINISH" )

REQUIRE_GREP=0
REQUIRE_SED=0
REQUIRE_DATE=0
REQUIRE_AWK=0
REQUIRE_WGET=0

function welcome() {
  echo -e "\033[00;32mDiary Infra installation\033[00m"
}

function installation_complete() {
  echo -e "\033[00;32mInstallation complete\033[00m"

  # If you want the install script to terminate automatically:
  #exit 0
}

function installation_incomplete() {
  echo -e "\033[00;31mWhoopsie!\033[00m"
}

#function main_menu_prompt() {
#  echo "What ye want?"
#}

#function task_menu_prompt() {
#  echo "TAAASK?"
#}

#function skip_menu_prompt() {
#  echo "SKIPP?"
#}
