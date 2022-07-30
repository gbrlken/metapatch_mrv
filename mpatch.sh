#!/bin/bash
mrv=MRVPatcher-5.2.4.jar
configfile=.pconf
version=2.11.280722
dev=1
sh=0
sif=0
fnv=1
ss=0
sw=1
ep=0
offline=0
ann=" "
off2=0
sloc="storage/downloads"
jloc="java"
latestv=" "

#latest_change=" "
lcn="> -- fixes to the live announcements\n -- color changes\n -- added option to download\n    ChatHeadEnabler.apk\n -- fixed mismapped options\n -- added server busy message\n -- removed .sh file extension<"
hold=${lcn%%<*}
latest_change=${hold#*>}


#========================================ADD SERVER BUSY MESSAGE - dark yellow - create new text file with one character for detection
CHANGELOG () {
clear
echo " "
echo "=============[ CHANGELOG ]============"
echo " "
echo "1.0.260722 - 2.10.280722"
echo " -- bug fixes"
echo " -- added update option"
echo " -- added additional features"
echo " -- visual changes"
echo " -- more visual changes"
echo " -- removed some useless code"
echo " -- autodelete left-over apks"
echo " -- removed more useless code"
echo " -- added hidden update channel (dev)"
echo " -- fixed channel complications"
echo " -- added option to check for updates"
echo " -- changed to automatic update detection"
echo " -- fixed the update screen"
echo -e " -- separated changelog screen\n -- changed timings"
echo -e " -- fixed changelog layout\n -- fixed updater layout"
echo -e " -- visual improvements\n -- removal of some redundant codes\n -- added live announcements"
echo " "
if [ $dev = 0 ]; then echo "${version}"; fi
if [ $dev = 1 ]; then echo "${version}dev"; fi
echo -e "${latest_change}"
echo "======================================"
echo " "
echo [c] Go Back
read -p 'Input: ' inn
if [ $inn = c ]; then START; fi
}

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

#packagename=pages.app
#patchname=MetaBusinessSuite
#appname="Meta Business Suite"
#${action}

#packagename=work
#patchname=Workplace
#appname="Workplace from Meta"
#${action}

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
#cya="\e[96m"
cya="\e[94m"
res="\e[0m"

packagename=init
patchname=init
appname=init


update_screen () {
  offline=0
  off2=0
  rm -rf temp
  clear
  echo " "
  echo "============[ UPDATER ]============"
  echo " "
  if [ $dev = 0 ]; then
      #clear
      echo "> Searching for updates..."
      sleep 0.2
      echo "> Please wait..."
      wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/beta/mpatch -P $(pwd)/temp || offline=1
      if [ $offline = 1 ]; then
        wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/dev/netcheck.txt -P $(pwd)/temp || off2=1
      fi
      FILE="temp/mpatch"
      i=0
      while read line; do
        i=$(( i + 1 ))
        test $i = 4 && latestvh="$line";
      done <"$FILE"
      #do
        #subdir=${latestv%% *}
        latestv=${latestvh#*=}
      #done

      i=0
      while read -r line; do
        i=$(( i + 1 ))
        test $i = 20 && uchangeh="$line";
      done <"$FILE"
      #do
        subdir=${uchangeh%%<*}
        uchange=${subdir#*>}
      #done


      vu=1
      rm -rf temp
      #update_screen
    fi
    if [ $dev = 1 ]; then
      #clear
      echo "> Searching for updates..."
      sleep 0.2
      echo "> Please wait..."
      wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/dev/mpatch -P $(pwd)/temp || offline=1
      if [ $offline = 1 ]; then
        wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/dev/netcheck.txt -P $(pwd)/temp || off2=1
      fi
      FILE="temp/mpatch"
      i=0
      while read line; do
        i=$(( i + 1 ))
        test $i = 4 && latestvh="$line";
      done <"$FILE"
      #do
        #subdir=${latestv%% *}
        latestv=${latestvh#*=}
      #done

      i=0
      while read -r line; do
        i=$(( i + 1 ))
        test $i = 20 && uchangeh="$line";
      done <"$FILE"
      #do
        subdir=${uchangeh%%<*}
        uchange=${subdir#*>}
      #done


      vu=1
      rm -rf temp
      #update_screen
    fi

  clear
  #CHANGELOG
  #echo " "
  echo " "
  echo "=================[ UPDATER ]================="
  echo " "
  echo "Updates are announced at the Telegram channel"
  echo "https://t.me/chatheads"
  #echo "Proceed if your current version is not the same"
  #echo "as the ones on the Telegram channel."
  if [ $dev = 1 ]; then
    echo " "
    echo -e "${gry}Enter 'switch' to use stable version${res}"
  fi
  echo "---------------------------------------------"
  #echo " "
  if [ $dev = 0 ]; then echo -e "Current Version: ${ylw}${version}${res}"; fi
  if [ $dev = 1 ]; then echo -e "Current Version: ${ylw}${version}dev${res}"; fi

  #if [ $dev = 0 ]; then echo -e "Latest Version: ${grn}${latestv}${res}"; fi
  #if [ $dev = 1 ]; then echo -e "Latest Version: ${grn}${latestv}dev${res}"; fi
  #if [ $vu = 1 ]; then
  if [ $offline = 1 ]; then
    echo " "
    if [ $off2 = 1 ]; then
      echo -e "${red}+-----------------+"
      echo -e "| You are offline |"
      echo -e "+-----------------+${res}"
    else
      echo -e "${ylw}+------------------------------+"
      echo -e "| Server Busy, Try again later |"
      echo -e "+------------------------------+${res}"
    fi
    echo " "
    echo [r] Refresh
    echo [c] Cancel
    read -p 'Input: ' inn
    if [ $inn = c ]; then START; fi
    if [ $inn = r ]; then
      offline=0
      rm -rf temp
      update_screen
    fi
  else
    if [ "${version}" = "${latestv}" ]; then
      echo " "
      echo -e "+-------------------------------+"
      echo -e "| You are on the latest version |"
      echo -e "+-------------------------------+"
      echo " "
    else
      echo " "
      if [ $dev = 0 ]; then
        echo -e "${blu}+-------------------------------+${res}"
        echo -e "${blu}|${res} Update Available: ${grn}${latestv}${blu} |${res}"
        echo -e "${blu}+-------------------------------+${res}"
      fi
      if [ $dev = 1 ]; then
        echo -e "${blu}+----------------------------------+${res}"
        echo -e "${blu}|${res} Update Available: ${grn}${latestv}dev${blu} |${res}"
        echo -e "${blu}+----------------------------------+${res}"
      fi
      echo " "
      echo -e "${ylw}What's new:"
      echo -e "${uchange}${res}"
      echo " "
    fi
  #fi
  
  echo " "
  echo -e "[p] Proceed ${gry}(Download Latest)${res}"
  echo [r] Refresh
  echo [c] Cancel
  read -p 'Input: ' inn
  if [ $inn = c ]; then START; fi
  if [ $inn = p ]; then
    clear
    echo " "
    echo "=============[ UPDATER ]============"
    echo " "
    echo "> Downloading latest..."
    sleep 0.2
    echo "> Please wait..."
    if [ $dev = 0 ]; then
      wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/beta/mpatch -P $(pwd)/temp && rm mpatch && mv $(pwd)/temp/mpatch $(pwd)/mpatch && chmod +x mpatch
    fi
    if [ $dev = 1 ]; then
      wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/dev/mpatch -P $(pwd)/temp && rm mpatch && mv $(pwd)/temp/mpatch $(pwd)/mpatch && chmod +x mpatch
    fi
    rm -rf temp
    ./mpatch
    exit
  fi

  if [ $inn = r ]; then
      offline=0
      rm -rf temp
      update_screen
    fi

  if [ $inn = switch ]; then
    clear
    echo " "
    echo "=============[ UPDATER ]============"
    echo " "
    echo "> Switching channel..."
    sleep 0.4
    echo "> Please wait..."
    if [ $dev = 1 ]; then
      wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/beta/mpatch -P $(pwd)/temp && rm mpatch && mv $(pwd)/temp/mpatch $(pwd)/mpatch && chmod +x mpatch
    fi
    if [ $dev = 0 ]; then
      wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/dev/mpatch -P $(pwd)/temp && rm mpatch && mv $(pwd)/temp/mpatch $(pwd)/mpatch && chmod +x mpatch
    fi
    rm -rf temp
    ./mpatch
    exit
  fi
  fi
  offline=0
  rm -rf temp
}



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
      echo -e "${red}====================================${res}"
      echo -e "${red}Skipping ${appname}${res}"
      echo -e "${red}====================================${res}"
      echo "  Reason: A patched apk named \"${patchname}.apk\" is coexisting with its candidate apk."
      echo "  --Delete it first or move it to a different directory."
    fi
  else
    echo -e "${ylw}===================================${res}"
    echo -e "${ylw}Processing ${appname}...${res}"
    echo -e "${ylw}===================================${res}"
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
    sleep 0.1
    echo -e "${ylw}Deleting old apk...${res}"
    rm ${sloc}/*${packagename}*arm64*
    #sleep 1
    #echo -e "${ylw}Creating MetaPatch folder...${res}"
    #mkdir ${sloc}/MetaPatch
    sleep 0.3
    echo -e "${ylw}Moving patched apk to MetaPatch folder...${res}"
    #mv ${sloc}/${patchname}_${ver}.apk ${sloc}/MetaPatch
    sleep 0.2
    echo -e "${grn}Done Processing.${res}"
    sleep 1
  fi
else
  if [ $ss = 1 ]; then
    echo " "
    echo -e "${blu}====================================${res}"
    echo -e "${blu}Skipping ${appname}${res}"
    echo -e "${blu}====================================${res}"
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
      echo -e "${red}====================================${res}"
      echo -e "${red}Skipping [arm]${appname}${res}"
      echo -e "${red}====================================${res}"
      echo "  Reason: A patched apk named \"[arm]${patchname}.apk\" is coexisting with its candidate apk."
      echo "  --Delete it first or move it to a different directory."
    fi
  else
    echo -e "${ylw}====================================${res}"
    echo -e "${ylw}Processing [arm]${appname}...${res}"
    echo -e "${ylw}====================================${res}"
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
    sleep 0.1
    echo -e "${ylw}Deleting old apk...${res}"
    rm ${sloc}/*${packagename}*armeabi*
    #sleep 1
    #echo -e "${ylw}Creating MetaPatch folder...${res}"
    #mkdir ${sloc}/MetaPatch
    sleep 0.3
    echo -e "${ylw}Moving patched apk to MetaPatch folder...${res}"
    #mv "${sloc}/[arm]${patchname}_${ver}.apk" ${sloc}/MetaPatch
    sleep 0.2
    echo -e "${grn}Done Processing.${res}"
    sleep 1
  fi
else
  if [ $ss = 1 ]; then
    echo " "
    echo -e "${blu}====================================${res}"
    echo -e "${blu}Skipping [arm]${appname}${res}"
    echo -e "${blu}====================================${res}"
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
cont=1
clear
echo " "
if [ $dev = 0 ]; then echo -e "=====[ ${cya}Meta${res}Patch ${gry}${version}${res} ]====="; fi
if [ $dev = 1 ]; then echo -e "=====[ ${cya}Meta${res}Patch ${gry}${version}dev${res} ]====="; fi
echo " "
echo "> Loading..."
wget -q https://github.com/gbrlken/metapatch_mrv/releases/download/dev/announce.txt -P $(pwd)/cache/ann && rm -f cache/announce.txt && mv cache/ann/announce.txt cache/announce.txt
FILE="cache/announce.txt"
if [ $cont = 1 ]; then
  i=0
  while read -r line; do
    i=$(( i + 1 ))
    test $i = 1 && ann="$line";
  done <"$FILE"
fi

clear
echo " "
if [ $dev = 0 ]; then echo -e "=====[ ${cya}Meta${res}Patch ${gry}${version}${res} ]====="; fi
if [ $dev = 1 ]; then echo -e "=====[ ${cya}Meta${res}Patch ${gry}${version}dev${res} ]====="; fi
#echo " "
#if [ "$anns" = "1" ]; then
  echo -e "${ann}"
#  echo " "
#fi
if [ $jloc = "java" ]; then
  if ! command -v java &> /dev/null; then
    echo -e "${red}[JDK Not Installed]${res}"
    echo -e "${gry}Configure at Preferences${res}"
    ticket_start=0
  else
    ticket_start=1
  fi
else
  if ! command -v ${jloc} &> /dev/null; then
    echo -e "${red}[JDK Missing]${res}"
    echo -e "${gry}Configure at Preferences${res}"
    ticket_start=0
  else
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
echo -e "File Output at: \n${ylw}Download/MetaPatch/AppName_#.#.apk${res}"
echo "[dc] Download ChatHeadEnabler.apk"

echo " "
if ! command -v ${jloc} &> /dev/null; then
  echo -e "${red}[JDK is not installed]${res}"
fi
echo "[p] Patch    [r] Refresh"
echo "[u] Update   [l] Changelog"
if [ $sh = 0 ]; then echo "[e] Exit     [h] Show Help"; fi
if [ $sh = 1 ]; then echo "[e] Exit     [h] Hide Help"; fi
echo " "
read -p 'Input: ' in 
if [ $in = e ]; then exit; fi
if [ $in = u ]; then update_screen; fi
if [ $in = l ]; then CHANGELOG; fi
if [ $in = p ]; then 
  if [ $ticket_start = 1 ]; then
    PROCEED
  else
    echo " "
    echo -e "${red}Missing Dependency: JDK${res}"
    PRESSCONT
    TOP_MAIN
  fi
fi
if [ $in = dc ]; then 
  clear
  echo " "
  if [ $dev = 0 ]; then echo -e "=====[ ${cya}Meta${res}Patch ${gry}${version}${res} ]====="; fi
  if [ $dev = 1 ]; then echo -e "=====[ ${cya}Meta${res}Patch ${gry}${version}dev${res} ]====="; fi
  echo " "
  echo "> Downloading ChatHeadEnabler.apk..."
  sleep 0.2
  echo "> Please wait..."
  prcd=0
  wget -q https://github.com/NeonOrbit/ChatHeadEnabler/releases/download/v2.4.0/ChatHeadEnabler-v2.4.0.apk -P ~/storage/downloads/MetaPatch && prcd=1
  echo " "
  if [ $prcd = 1 ]; then
    echo "> ChatHeadEnabler.apk downloaded successfully."
    sleep 0.2
    echo "> File saved at Download/MetaPatch"
  else
    echo "> Failed to download ChatHeadEnabler.apk."
    sleep 0.1
    echo "> Check your connection."
  fi
  echo " "
  PRESSCONT
  TOP_MAIN
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

grant_perm () {
  clear
  if [ -d $sloc ]; then
    echo "Message: Permission already granted"
  else
    echo ">Grant storage permission"
    termux-setup-storage
    sleep 0.5
    echo Please wait...
    sleep 2
  fi
  echo "[p] Proceed"
  echo "[r] Retry"
  read -p 'Input: ' in 
  if [ $in != p ]; then grant_perm; fi
}

TOP_MAIN () {
clear
  if ! command -v ${jloc} &> /dev/null; then
    echo "[MetaPatch by gbrlken]"
    echo ">Initializing"
    sleep 0.5
    clear
    echo "[MetaPatch by gbrlken]"
    echo ">Initializing."
    sleep 0.2
    clear
    echo "[MetaPatch by gbrlken]"
    echo ">Initializing.."
    sleep 0.3
    clear
    echo "[MetaPatch by gbrlken]"
    echo ">Initializing..."
    sleep 1
    echo ">Installing dependencies..."
    sleep 0.4
    echo ">>Enter 'Y' to all if asked."
    sleep 3
    echo " "
    echo "Please wait"
    sleep 0.6
    clear
    echo "[MetaPatch by gbrlken]"
    echo ">Initializing..."
    echo ">Installing dependencies..."
    echo ">>Enter 'Y' to all if asked."
    echo " "
    echo "Please wait."
    sleep 0.4
    clear
    echo "[MetaPatch by gbrlken]"
    echo ">Initializing..."
    echo ">Installing dependencies..."
    echo ">>Enter 'Y' to all if asked."
    echo " "
    echo "Please wait.."
    sleep 0.8
    clear
    echo "[MetaPatch by gbrlken]"
    echo ">Initializing..."
    echo ">Installing dependencies..."
    echo ">>Enter 'Y' to all if asked."
    echo " "
    echo "Please wait..."


    sleep 0.2
    pkg upgrade -y
    pkg install openjdk-17 -y
    echo " "
    echo " "
    sleep 1
    echo ">Done installing dependencies."
    sleep 0.3
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
    grant_perm
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
    sleep 0.4
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
