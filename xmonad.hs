import XMonad
import XMonad.Actions.Volume
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Layout.WorkspaceDir
import XMonad.Prompt
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

main = do
    spawn "nm-applet --sm-disable"
    xmproc <- spawnPipe "/home/dmitri/.cabal/bin/xmobar /home/dmitri/.xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts  $  workspaceDir "~"  $  layoutHook defaultConfig
        , focusFollowsMouse = False
        , focusedBorderColor = "#00a000"
        , borderWidth = 3
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
                        >> updatePointer Nearest
        } `additionalKeys`
        [ ((mod1Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command -l")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod1Mask, xK_F2), lowerVolume 4 >> return())
        , ((mod1Mask, xK_F3), raiseVolume 4 >> return())
        , ((mod1Mask, xK_F1), toggleMute >> return())
        , ((mod1Mask .|. shiftMask, xK_x), changeDir defaultXPConfig)
        ]
