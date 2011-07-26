import XMonad                                 -- importa conf basica
import XMonad.Util.Run (spawnPipe)            -- spawnPipe para abrir programas no start-up

import XMonad.Layout.NoBorders (smartBorders) -- importante para o tray

import XMonad.Util.EZConfig(additionalKeysP)                                  -- criar teclas de atalho
import XMonad.Actions.CycleWS (nextWS, prevWS, shiftToNext, shiftToPrev)     -- navegar workspaces

import XMonad.Hooks.ManageDocks (avoidStruts, manageDocks)                   -- importante para o tray
import XMonad.Hooks.EwmhDesktops                                             -- importante para o tray
import qualified XMonad.StackSet as W   -- manageHook rules


main = do tint2     <- spawnPipe "tint2"                -- carrega o tint2
          dropbox   <- spawnPipe "dropbox start"        -- start dropbox
          volume    <- spawnPipe "gnome-volume-control-applet"   
          rede      <- spawnPipe "nm-applet"
          wallpaper <- spawnPipe "feh --bg-center ~/Pictures/wallpaper.jpg"
          xmonad $ myConfig                            -- abre o xmonad com as configurações myConfig

myConfig = ewmh $ defaultConfig { --  modMask = mod4Mask   -- muda modMask para tecla do windows
                                  modMask = mod1Mask   -- muda modMask para Alt Esquerdo (Default)
                                , borderWidth  = 1
                                , terminal = "gnome-terminal"
                                , manageHook = myManageHook
                                , layoutHook = myLayoutHook
                                , workspaces = myWorkspaces                               
                                , focusFollowsMouse   = False
                                } `additionalKeysP` myKeys


myManageHook = manageDocks <+> (manageHook defaultConfig)

myLayoutHook = smartBorders $ avoidStruts $ layoutHook defaultConfig

myWorkspaces = ["general", "internet", "pdf", "code"] ++ (map show [5..9 :: Int])

myKeys =  [ ("C-M1-<Right>"     , nextWS)                         -- vai para o próximo workspace
          , ("C-M1-<Left>"      , prevWS)                         -- vai para o workspace anterior
          , ("C-M1-S-<Right>"   , shiftToNext >> nextWS)          -- move janela para próximo ws
          , ("C-M1-S-<Left>"    , shiftToPrev >> prevWS)          -- move janela para próximo ws
          , ("C-M1-S-<Up>"      , windows (W.shift "general") )  -- manda para a janela "general"
          , ("C-M1-s"        , spawn "~/.bin/setwallpaper.sh") -- muda wallpaper
          , ("C-M1-w"        , spawn "chromium-browser")       -- carrega chromium            
          ]

