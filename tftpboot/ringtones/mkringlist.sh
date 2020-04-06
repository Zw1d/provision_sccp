outfile=ringlist.xml
echo -e "<CiscoIPPhoneRingList>" >$outfile
i=0
if [ ! -z "`ls *.pcm 2>/dev/null`" ]; then
        for filename in *.pcm;do
                if [ ${#filename} -le 25 ]; then
                        if [ $i -ge 50 ]; then
                                echo "Maximum of 50 ringtones reached"
                                break
                        fi
                        i=$(( $i + 1 ));
                        basename=`basename ${filename} .pcm`
                        basename=`echo ${basename}|  cut -c -25 `

                        echo -e "\t<Ring>" >>$outfile
                        echo -e "\t\t<DisplayName>${basename}</DisplayName>" >>$outfile
                        echo -e "\t\t<FileName>${filename}</FileName>" >>$outfile
                        echo -e "\t</Ring>" >>$outfile
                fi
        done
fi
if [ ! -z "`ls *.raw 2>/dev/null`" ]; then
        for filename in *.raw;do
                if [ $i -ge 50 ]; then
                        echo "Maximum of 50 ringtones reached"
                        break
                fi
                i=$(( $i + 1 ));
                basename=`basename ${filename} .raw`
                echo -e "\t<Ring>" >>$outfile
                echo -e "\t\t<DisplayName>${basename}</DisplayName>" >>$outfile
                echo -e "\t\t<FileName>${filename}</FileName>" >>$outfile
                echo -e "\t</Ring>" >>$outfile
        done
fi
echo -e "</CiscoIPPhoneRingList>" >>$outfile
