# This script enables conversion of mp4 videos which would not be properly displayed in Hyperspin
# Requires HandBrake and HandBrakeCLI to be installed
# HandBrake 	https://handbrake.fr/
# HandBrakeCLI	https://handbrake.fr/downloads2.php

# Usage : Configure a source directory from where your videos will be read from : $src_dir
#         Configure a target directory where converted videos will be written to : $tgt_dir
#         Directories must finish with a trailing slash
#         Run and wait for the process to be finished (can take several hours for thousands of videos)

# Configuration below
$exe_handbrake = "C:\Program Files\HandBrake\HandBrakeCLI.exe"

$src_dir = "D:/HyperSpin/Media/MAME/Video_notworking/"
$tgt_dir = "D:/HyperSpin/Media/MAME/Video/"

# Do not edit below unless you would like to change the extension
$video_src_dir = get-childitem $src_dir/*.mp4 -recurse
$List = $video_src_dir | where {$_.extension -eq ".mp4"}

Foreach ($src_file IN $List)
{
	$src_filename = $src_file.name
	
	$cmd_convert = "$exe_handbrake -i $src_dir" + $src_filename +  " -O -o " + $tgt_dir + $src_filename 
	$cmd_arguments = "-i $src_dir" + $src_filename +  " -O -o " + $tgt_dir + $src_filename
	start-process -Wait $exe_handbrake $cmd_arguments
}