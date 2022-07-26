#!/bin/bash
mrv=MRVPatcher-5.2.4.jar
configfile=.pconf
sh=0

sif=0
fnv=1
ss=0
sw=1
ep=0
#sloc="$(pwd)"
sloc="storage/downloads"
jloc="java"

action="echo Something is wrong."
APP_LIST () {
#===============MESSENGER
packagename=orca
patchname=Messenger
appname="Messenger"
${action}

#===============FACEBOOK
packagename=katana
patchname=Facebook
appname="Facebook"
${action}

#===============MESSENGERLITE
packagename=mlite
patchname=MessengerLite
appname="Messenger Lite"
${action}

#===============FACEBOOKLITE
packagename=facebook.lite
patchname=FBLite
appname="Facebook Lite"
${action}

#==============================================================================INSERT BELOW
#======FORMAT=======
#packagename=enter.unique.identifier.here
#patchname=EnterNameForPatchedApkHere
#appname=Enter Name For Printing - Use quotation marks
#${action}
#=======END=========

packagename=pages.app
patchname=MetaBusinessSuite
appname="Meta Business Suite"
${action}

packagename=work
patchname=Workplace
appname="Workplace from Meta"
${action}

#==============================================================================INSERT ABOVE

}


PRESS () {
read -n 1 -r -s -p "Press any key to exit..."
echo " "
}
PRESSCONT () {
read -n 1 -r -s -p "Press any key to continue..."
echo " "
}
CONFIRM () {
read -n 1 -r -s -p "Press any key to confirm..."
echo " "
}
LNBR () {
holder=0
#echo "====================================================================================="
}
gry="\e[90m"
red="\e[91m"
grn="\e[92m"
ylw="\e[93m"
dylw="\e[93m"
blu="\e[94m"
res="\e[0m"

packagename=init
patchname=init
appname=init

LOCATE () {
#===========ARM64
#echo " "
warn=0
verl=0
if [ -f ${sloc}/${patchname}.apk ]; then
  if [ $fnv = 0 ]; then warn=1; fi
fi

if [ -f ${sloc}/*${packagename}*arm64* ]; then
  for f in ${sloc}/*${packagename}*arm64*
  do
    subdir=${f%%-*}
    verl=${subdir#*_}
  done
  if [ $warn = 1 ]; then
    echo -e "  ${red}[-] [64bit]${appname}${res}"
  else
    echo -e "  ${grn}[X] [64bit]${appname}${res} ${verl}"
  fi
else
  echo -e "  ${gry}[ ] [64bit]${appname}${res}"
fi
#===========ARM
warn_a=0
verl=0
if [ -f "${sloc}/[arm]${patchname}.apk" ]; then
  if [ $fnv = 0 ]; then warn_a=1; fi
fi

if [ -f ${sloc}/*${packagename}*armeabi* ]; then
  for f in ${sloc}/*${packagename}*armeabi*
  do
    subdir=${f%%-*}
    verl=${subdir#*_}
  done
  if [ $warn_a = 1 ]; then
    echo -e "  ${red}[-] [32bit]${appname}${res}"
  else
    echo -e "  ${grn}[X] [32bit]${appname}${res} ${verl}"
  fi
else
  echo -e "  ${gry}[ ] [32bit]${appname}${res}"
fi

}

PROCESS () {
#==============ARM64
warn=0
ver=0
if [ -f ${sloc}/${patchname}.apk ]; then
  if [ $fnv = 0 ]; then warn=1; fi
fi

if [ -f ${sloc}/*${packagename}*arm64* ]; then
  echo " "
  if [ $warn = 1 ]; then
    if [ $sw = 1 ]; then
      echo -e "${red}===================================================${res}"
      echo -e "${red}Skipping ${appname}${res}"
      echo -e "${red}===================================================${res}"
      echo "  Reason: A patched apk named \"${patchname}.apk\" is coexisting with its candidate apk."
      echo "  --Delete it first or move it to a different directory."
    fi
  else
    echo -e "${ylw}===================================================${res}"
    echo -e "${ylw}Processing ${appname}...${res}"
    echo -e "${ylw}===================================================${res}"
    ${jloc} -jar $mrv -o ${sloc}/MetaPatch ${sloc}/*${packagename}*arm64*
    
    for f in ${sloc}/*${packagename}*arm64*
    do
      subdir=${f%%-*}
      ver=${subdir#*_}
    done
    
    echo -e "${ylw}Renaming modified apk...${res}"
      if [ -f ${sloc}/MetaPatch/*${packagename}*arm64*-mrv* ]; then
        mv ${sloc}/MetaPatch/*${packagename}*arm64*-mrv* ${sloc}/MetaPatch/${patchname}_${ver}.apk
      fi
      if [ -f ${sloc}/MetaPatch/*${packagename}*arm64*-signed* ]; then
        mv ${sloc}/MetaPatch/*${packagename}*arm64*-signed* ${sloc}/MetaPatch/${patchname}_${ver}.apk
      fi
    
    echo -e "${ylw}Creating MetaPatch folder...${res}"
    #mkdir ${sloc}/MetaPatch
    
    echo -e "${ylw}Moving patched apk to MetaPatch folder...${res}"
    #mv ${sloc}/${patchname}_${ver}.apk ${sloc}/MetaPatch
    
    echo -e "${grn}Done Processing.${res}"
  fi
else
  if [ $ss = 1 ]; then
    echo " "
    echo -e "${blu}===================================================${res}"
    echo -e "${blu}Skipping ${appname}${res}"
    echo -e "${blu}===================================================${res}"
    echo "  Reason: Candidate apk not available."
  fi
fi

#======================ARM
warn_a=0
ver=0
if [ -f "${sloc}/[arm]${patchname}.apk" ]; then
  if [ $fnv = 0 ]; then warn_a=1; fi
fi

if [ -f ${sloc}/*${packagename}*armeabi* ]; then
  echo " "
  if [ $warn_a = 1 ]; then
    if [ $sw = 1 ]; then
      echo -e "${red}===================================================${res}"
      echo -e "${red}Skipping [arm]${appname}${res}"
      echo -e "${red}===================================================${res}"
      echo "  Reason: A patched apk named \"[arm]${patchname}.apk\" is coexisting with its candidate apk."
      echo "  --Delete it first or move it to a different directory."
    fi
  else
    echo -e "${ylw}===================================================${res}"
    echo -e "${ylw}Processing [arm]${appname}...${res}"
    echo -e "${ylw}===================================================${res}"
    ${jloc} -jar $mrv -o ${sloc}/MetaPatch ${sloc}/*${packagename}*armeabi*
    
    for f in ${sloc}/*${packagename}*armeabi*
    do
      subdir=${f%%-*}
      ver=${subdir#*_}
    done
    
    echo -e "${ylw}Renaming modified apk...${res}"
      if [ -f ${sloc}/MetaPatch/*${packagename}*armeabi*-mrv* ]; then
        mv ${sloc}/MetaPatch/*${packagename}*armeabi*-mrv* "${sloc}/MetaPatch/[arm]${patchname}_${ver}.apk"
      fi
      if [ -f ${sloc}/MetaPatch/*${packagename}*armeabi*-signed* ]; then
        mv ${sloc}/MetaPatch/*${packagename}*armeabi*-signed* "${sloc}/MetaPatch/[arm]${patchname}_${ver}.apk"
      fi
    
    echo -e "${ylw}Creating MetaPatch folder...${res}"
    #mkdir ${sloc}/MetaPatch
    
    echo -e "${ylw}Moving patched apk to MetaPatch folder...${res}"
    #mv "${sloc}/[arm]${patchname}_${ver}.apk" ${sloc}/MetaPatch
    
    echo -e "${grn}Done Processing.${res}"
    
  fi
else
  if [ $ss = 1 ]; then
    echo " "
    echo -e "${blu}===================================================${res}"
    echo -e "${blu}Skipping [arm]${appname}${res}"
    echo -e "${blu}===================================================${res}"
    echo "  Reason: Candidate apk not available."
  fi
fi

}

PROCEED () {
action="PROCESS"
APP_LIST

echo " "
if [ $ep = 1 ]; then 
  PRESS
  exit
fi
if [ $ep = 0 ]; then 
  PRESSCONT
  TOP_MAIN
fi
}



START () {
clear
if [ $jloc = "java" ]; then
  if ! command -v java &> /dev/null; then
    echo -e "${red}[JDK Not Installed]${res}"
    echo -e "${gry}Configure at Preferences${res}"
    ticket_start=0
  else
    echo -e "${grn}[Patcher & JDK Detected]${res}"
    ticket_start=1
  fi
else
  if ! command -v ${jloc} &> /dev/null; then
    echo -e "${red}[JDK Missing]${res}"
    echo -e "${gry}Configure at Preferences${res}"
    ticket_start=0
  else
    echo -e "${grn}[Patcher & JDK Detected]${res}"
    ticket_start=1
  fi
fi
echo Candidate apks found:

action="LOCATE"
APP_LIST

if [ $sh = 1 ]; then
echo " "
echo -e "${gry}[ ]${res} - No candidate apk found"
echo -e "${grn}[X]${res} - Will patch"
echo -e "${red}[-]${res} - Will not patch due to file conflict"
echo -e "${red}   --${res} A patched apk is coexisting with its corresponding candidate apk."
echo -e "${red}   --${res} Delete the patched file or move it to a different directory."
echo " "
echo "-- Place the downloaded Meta App apks on your downloads directory."
echo " "
echo Sample Apk Candidate file name
echo -e "   ${gry}com.${grn}facebook.katana${gry}_#.#.#.#.#-#_minAPI#(${grn}arm64-v8a${gry})(#dpi)_apkmirror.com${grn}.apk${res}"
echo -e "   ${gry}com.${grn}facebook.orca${gry}_#.#.#.#.#-#_minAPI#(${grn}arm64-v8a${gry})(#dpi)_apkmirror.com${grn}.apk${res}"
echo -e "   ${gry}com.${grn}facebook.mlite${gry}_#.#.#.#.#-#_minAPI#(${grn}arm64-v8a${gry})(#dpi)_apkmirror.com${grn}.apk${res}"
echo -e "   ${gry}com.${grn}facebook.lite${gry}_#.#.#.#.#-#_minAPI#(${grn}arm64-v8a${gry})(#dpi)_apkmirror.com${grn}.apk${res}"
echo -e "   ${gry}com.${grn}facebook.katana${gry}_#.#.#.#.#-#_minAPI#(${grn}armeabi-v7a${gry})(#dpi)_apkmirror.com${grn}.apk${res}"
echo -e "   ${gry}com.${grn}facebook.orca${gry}_#.#.#.#.#-#_minAPI#(${grn}armeabi-v7a${gry})(#dpi)_apkmirror.com${grn}.apk${res}"
echo -e "   ${gry}com.${grn}facebook.mlite${gry}_#.#.#.#.#-#_minAPI#(${grn}armeabi-v7a${gry})(#dpi)_apkmirror.com${grn}.apk${res}"
echo -e "   ${gry}com.${grn}facebook.lite${gry}_#.#.#.#.#-#_minAPI#(${grn}armeabi-v7a${gry})(#dpi)_apkmirror.com${grn}.apk${res}"
echo " "
echo Sample Patched Apk file name
echo -e "   ${grn}Facebook.apk"
echo "   Messenger.apk"
echo "   MessengerLite.apk"
echo "   FBLite.apk"
echo "   [arm]Facebook.apk"
echo "   [arm]Messenger.apk"
echo "   [arm]MessengerLite.apk"
echo -e "   [arm]FBLite.apk${res}"
echo " "
echo -e "${grn}<important for file detection>${res}"
echo -e "${gry}<could be anything>${res}"
echo " "
fi
# as-da-sd0-asd0-s0d-as0-d0sa-0d-sa0d-as0d-s0-das-0d-as0d-as0d-as0d
echo " "
echo -e "File Output at: \n${ylw}Downloads/MetaPatch/AppName_#.#.#.#.#.apk${res}"


echo " "
if ! command -v ${jloc} &> /dev/null; then
  echo -e "${red}[JDK is not installed]${res}"
fi
echo [s] Start Patching Process
echo [r] Refresh
if [ $sh = 0 ]; then echo "[h] Show Help"; fi
if [ $sh = 1 ]; then echo "[h] Hide Help"; fi
echo [e] Exit
read -p 'Input: ' in 
if [ $in = e ]; then exit; fi
if [ $in = s ]; then 
  if [ $ticket_start = 1 ]; then
    PROCEED
  else
    echo " "
    echo -e "${red}Missing Dependency: JDK${res}"
    PRESSCONT
    TOP_MAIN
  fi
fi
if [ $in = r ]; then TOP_MAIN; fi
if [ $in = h ]; then
  if [ $sh = 0 ]; then
  sh=1
  else
  sh=0
  fi
fi
START
}

TOP_MAIN () {
clear
  if ! command -v ${jloc} &> /dev/null; then
    echo ">Initializing"
    sleep 1
    clear
    echo ">Initializing."
    sleep 1
    clear
    echo ">Initializing.."
    sleep 2
    clear
    echo ">Initializing..."
    sleep 1
    echo ">Installing dependencies..."
    sleep 1
    echo ">>Enter 'Y' to all if asked."
    sleep 3
    echo " "
    echo "Please wait"
    sleep 1
    clear
    echo ">Initializing..."
    echo ">Installing dependencies..."
    echo ">>Enter 'Y' to all if asked."
    echo " "
    echo "Please wait."
    sleep 1
    clear
    echo ">Initializing..."
    echo ">Installing dependencies..."
    echo ">>Enter 'Y' to all if asked."
    echo " "
    echo "Please wait.."
    sleep 1
    clear
    echo ">Initializing..."
    echo ">Installing dependencies..."
    echo ">>Enter 'Y' to all if asked."
    echo " "
    echo "Please wait..."


    sleep 1
    pkg upgrade -y
    pkg install openjdk-17 -y
    echo " "
    echo " "
    sleep 1
    echo ">Done installing dependencies."
    sleep 1
    echo "Please wait..."
    sleep 2
  fi

if [ -f "$mrv" ]; then
  echo " "
else
  if [ -d $sloc ]; then
    if [ -f ${sloc}/$mrv ]; then
      cp ${sloc}/$mrv $(pwd)
    fi
  else
    clear
    echo ">Grant storage permission"
    sleep 1
    termux-setup-storage
    echo Please wait...
    sleep 5
    if [ -f ${sloc}/$mrv ]; then
      cp ${sloc}/$mrv $(pwd)
    fi
  fi
fi

if [ -f "$mrv" ]; then
  START
else
  if [ -f MRVPatch* ]; then
    mv MRVPatch* $mrv
    TOP_MAIN
  else
    pkg upgrade -y
    pkg install wget -y
    wget https://github.com/NeonOrbit/Files/releases/download/mrv-p/MRVPatcher-5.2.4.jar -P $(pwd)
    echo " "
    echo " "
    sleep 1
    echo "Please wait..."
    sleep 2
    TOP_MAIN
    #echo -e "${red}[Patcher not found]${res}"
    #echo --Download it at "https://github.com/NeonOrbit/Files/releases/download/mrv-p/MRVPatcher-5.2.4.jar"
    #echo "  then place it to the downloads directory then refresh."
  fi
fi

echo " "
echo [r] Refresh
echo [e] Exit
while [ con != r ]
do
  read -p 'Input: ' con
  if [ $con = r ]; then
    TOP_MAIN
  fi
  if [ $con = e ]; then
    exit
  fi
  echo Invalid Input
done
}
TOP_MAIN

