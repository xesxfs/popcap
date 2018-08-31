package com.popcap.flash.games.zuma2.logic
{
   import com.popcap.flash.framework.resources.images.ImageDescriptor;
   import com.popcap.flash.framework.resources.images.ImageInst;
   import com.popcap.flash.framework.resources.images.ImageManager;
   import com.popcap.flash.framework.resources.images.ImageResource;
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class Zuma2Images implements ImageManager
   {
      
      public static const IMAGE_POWERUP_REVERSE_PULSE:String = "IMAGE_POWERUP_REVERSE_PULSE";
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_UP_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_BACK_OVER:String = "IMAGE_OPTIONSMENU_BUTTON_BACK_OVER";
      
      private static const IMAGE_UPSELL_BUTTON_REDX_DOWN_RGB:Class = Zuma2Images_IMAGE_UPSELL_BUTTON_REDX_DOWN_RGB;
      
      public static const IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND:String = "IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND";
      
      private static const IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_RGB;
      
      private static const IMAGE_UI_MENUBUTTON_DOWN_RGB:Class = Zuma2Images_IMAGE_UI_MENUBUTTON_DOWN_RGB;
      
      public static const IMAGE_POWERUP_GREEN:String = "IMAGE_POWERUP_GREEN";
      
      public static const IMAGE_MAINMENU_BUTTON_SOUND_ON_UP:String = "IMAGE_MAINMENU_BUTTON_SOUND_ON_UP";
      
      public static const IMAGE_UPSELL_ADVENTURE:String = "IMAGE_UPSELL_ADVENTURE";
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_UP_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_ALPHA:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_ALPHA;
      
      private static const IMAGE_LEVELBACKGROUND_VOLCANO1_CHUTE1_ALPHA:Class = Zuma2Images_IMAGE_LEVELBACKGROUND_VOLCANO1_CHUTE1_ALPHA;
      
      public static const IMAGE_UI_SCORENUMBERS:String = "IMAGE_UI_SCORENUMBERS";
      
      private static const IMAGE_BACKGROUND_LEVEL4_TUNNEL2_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL4_TUNNEL2_ALPHA;
      
      public static const IMAGE_MAINMENU_BUTTON_BACKGROUND_UP:String = "IMAGE_MAINMENU_BUTTON_BACKGROUND_UP";
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_UP_RGB;
      
      public static const IMAGE_FRUIT_ACORN_GLOW:String = "IMAGE_FRUIT_ACORN_GLOW";
      
      private static const IMAGE_BALL_RING_RGB:Class = Zuma2Images_IMAGE_BALL_RING_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_HELP_UP_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_HELP_UP_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_PLAY_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_PLAY_OVER_RGB;
      
      private static const IMAGE_HELPSCREEN_BUTTON_PAGE2_UP_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_PAGE2_UP_RGB;
      
      private static const IMAGE_HELPSCREEN_BUTTON_CONTINUE_DOWN_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_CONTINUE_DOWN_RGB;
      
      private static const IMAGE_UI_SCOREBAR_RGB:Class = Zuma2Images_IMAGE_UI_SCOREBAR_RGB;
      
      private static const IMAGE_BALL_BLUE_EXPLOSION_RGB:Class = Zuma2Images_IMAGE_BALL_BLUE_EXPLOSION_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP_RGB;
      
      public static const IMAGE_BLOOM_BLAST_WHITE:String = "IMAGE_BLOOM_BLAST_WHITE";
      
      public static const IMAGE_UI_SCOREBAR:String = "IMAGE_UI_SCOREBAR";
      
      private static const IMAGE_BALL_ALPHA:Class = Zuma2Images_IMAGE_BALL_ALPHA;
      
      private static const IMAGE_BACKGROUND_LEVEL2_TUNNEL1_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL2_TUNNEL1_ALPHA;
      
      public static const IMAGE_BALL_BLUE:String = "IMAGE_BALL_BLUE";
      
      public static const IMAGE_CANNON_BLAST:String = "IMAGE_CANNON_BLAST";
      
      private static const IMAGE_MAINMENU_BUTTON_SOUND_ON_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_SOUND_ON_DOWN_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_SOUND_ON_DOWN:String = "IMAGE_MAINMENU_BUTTON_SOUND_ON_DOWN";
      
      public static const IMAGE_UI_MENUBUTTON_DOWN:String = "IMAGE_UI_MENBUTTON_DOWN";
      
      public static const IMAGE_INGAME_MENUBUTTON_DOWN:String = "IMAGE_INGAME_MENUBUTTON_DOWN";
      
      public static const IMAGE_FROG_CANNON_TONGUE:String = "IMAGE_FROG_CANNON_TONGUE";
      
      public static const IMAGE_MAINMENU_BUTTON_SOUND_OFF_DOWN:String = "IMAGE_MAINMENU_BUTTON_SOUND_OFF_DOWN";
      
      private static const IMAGE_SKULLPATH_ALPHA:Class = Zuma2Images_IMAGE_SKULLPATH_ALPHA;
      
      private static const IMAGE_DEATHSKULL_FIRERING_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_FIRERING_ALPHA;
      
      private static const IMAGE_DOT_BLACK_RGB:Class = Zuma2Images_IMAGE_DOT_BLACK_RGB;
      
      private static const IMAGE_BALL_WHITE_RGB:Class = Zuma2Images_IMAGE_BALL_WHITE_RGB;
      
      public static const IMAGE_BLOOM_BLAST_BLUE:String = "IMAGE_BLOOM_BLAST_BLUE";
      
      public static const IMAGE_BLOOM_REVERSE_GREEN:String = "IMAGE_BLOOM_REVERSE_GREEN";
      
      public static const IMAGE_STAT_SCREEN_UPSELL_BUTTON_DOWN:String = "IMAGE_STAT_SCREEN_UPSELL_BUTTON_DOWN";
      
      private static const IMAGE_FROG_CANNON_BOTTOM_RGB:Class = Zuma2Images_IMAGE_FROG_CANNON_BOTTOM_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_OVER_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_OVER_RGB;
      
      private static const IMAGE_BLOOM_BLAST_PURPLE_RGB:Class = Zuma2Images_IMAGE_BLOOM_BLAST_PURPLE_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_UP_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_UP_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_SOUND_ON_OVER:String = "IMAGE_MAINMENU_BUTTON_SOUND_ON_OVER";
      
      public static const IMAGE_UI_MENUBUTTON_OVER:String = "IMAGE_UI_MENUBUTTON_OVER";
      
      public static const IMAGE_INGAME_MENUBUTTON_OVER:String = "IMAGE_INGAME_MENUBUTTON_OVER";
      
      private static const IMAGE_HELPSCREEN_BUTTON_DONTSHOW_UP_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_DONTSHOW_UP_RGB;
      
      public static const IMAGE_DEATHSKULL_BASE:String = "IMAGE_DEATHSKULL_BASE";
      
      public static const IMAGE_MAINMENU_BUTTON_SOUND_OFF_OVER:String = "IMAGE_MAINMENU_BUTTON_SOUND_OFF_OVER";
      
      private static const IMAGE_STOP_OUTLINE_RGB:Class = Zuma2Images_IMAGE_STOP_OUTLINE_RGB;
      
      private static const IMAGE_POWERUP_BLUE_RGB:Class = Zuma2Images_IMAGE_POWERUP_BLUE_RGB;
      
      public static const IMAGE_POWERUP_RED:String = "IMAGE_POWERUP_RED";
      
      public static const IMAGE_BLOOM_STOP_YELLOW:String = "IMAGE_BLOOM_STOP_YELLOW";
      
      public static const IMAGE_HELPSCREEN_BUTTON_DONTSHOW_DOWN:String = "IMAGE_HELPSCREEN_BUTTON_DONTSHOW_DOWN";
      
      private static const IMAGE_BACKGROUND_LEVEL5_TUNNEL1_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL5_TUNNEL1_RGB;
      
      private static const IMAGE_BLOOM_ACCURACY_RED_RGB:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_RED_RGB;
      
      public static const IMAGE_STAT_SCREEN_UPSELL_BUTTON_OVER:String = "IMAGE_STAT_SCREEN_UPSELL_BUTTON_OVER";
      
      public static const IMAGE_MAINMENU_BUTTON_PLAY_UP:String = "IMAGE_MAINMENU_BUTTON_PLAY_UP";
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_UP_RGB;
      
      private static const IMAGE_BLOOM_ACCURACY_GREEN_ALPHA:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_GREEN_ALPHA;
      
      public static const IMAGE_BACKGROUND_LEVEL5_TUNNEL1:String = "IMAGE_BACKGROUND_LEVEL5_TUNNEL1";
      
      public static const IMAGE_DOT_PURPLE:String = "IMAGE_DOT_PURPLE";
      
      private static const IMAGE_LEVELBACKGROUND_VOLCANO1_RGB:Class = Zuma2Images_IMAGE_LEVELBACKGROUND_VOLCANO1_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER:String = "IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER";
      
      public static const IMAGE_INGAME_MENUBUTTON_UP:String = "IMAGE_INGAME_MENUBUTTON_UP";
      
      public static const IMAGE_HELPSCREEN_BUTTON_DONTSHOW_OVER:String = "IMAGE_HELPSCREEN_BUTTON_DONTSHOW_OVER";
      
      public static const IMAGE_EXPLOSION_BOMB:String = "IMAGE_EXPLOSION_BOMB";
      
      private static const IMAGE_MAINMENU_BUTTON_PLAY_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_PLAY_DOWN_RGB;
      
      private static const IMAGE_UI_LEVELS_FRAME_RGB:Class = Zuma2Images_IMAGE_UI_LEVELS_FRAME_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_UP:String = "IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_UP";
      
      public static const IMAGE_MAINMENU_BUTTON_SOUND_OFF_UP:String = "IMAGE_MAINMENU_BUTTON_SOUND_OFF_UP";
      
      private static const IMAGE_UI_BAR_RGB:Class = Zuma2Images_IMAGE_UI_BAR_RGB;
      
      private static const IMAGE_BLOOM_BLAST_GREEN_RGB:Class = Zuma2Images_IMAGE_BLOOM_BLAST_GREEN_RGB;
      
      private static const IMAGE_CANNON_BLAST_ALPHA:Class = Zuma2Images_IMAGE_CANNON_BLAST_ALPHA;
      
      private static const IMAGE_BALL_PURPLE_EXPLOSION_RGB:Class = Zuma2Images_IMAGE_BALL_PURPLE_EXPLOSION_RGB;
      
      private static const IMAGE_BALL_GREEN_EXPLOSION_ALPHA:Class = Zuma2Images_IMAGE_BALL_GREEN_EXPLOSION_ALPHA;
      
      public static const IMAGE_STOP_OUTLINE:String = "IMAGE_STOP_OUTLINE";
      
      private static const IMAGE_UPSELL_BUTTON_PURPLEX_UP_RGB:Class = Zuma2Images_IMAGE_UPSELL_BUTTON_PURPLEX_UP_RGB;
      
      private static const IMAGE_BLOOM_ACCURACY_BLUE_RGB:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_BLUE_RGB;
      
      private static const IMAGE_FROG_TONGUE_RGB:Class = Zuma2Images_IMAGE_FROG_TONGUE_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_BACK_OVER_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_BACK_OVER_RGB;
      
      private static const IMAGE_BALL_BLUE_RGB:Class = Zuma2Images_IMAGE_BALL_BLUE_RGB;
      
      private static const IMAGE_FROG_EYES_RGB:Class = Zuma2Images_IMAGE_FROG_EYES_RGB;
      
      private static const IMAGE_BLOOM_BLAST_YELLOW_RGB:Class = Zuma2Images_IMAGE_BLOOM_BLAST_YELLOW_RGB;
      
      private static const IMAGE_UPSELL_HEROIC_RGB:Class = Zuma2Images_IMAGE_UPSELL_HEROIC_RGB;
      
      private static const IMAGE_FROG_TOP_RGB:Class = Zuma2Images_IMAGE_FROG_TOP_RGB;
      
      public static const IMAGE_SKULLPATH_LIT:String = "IMAGE_SKULLPATH_LIT";
      
      private static const IMAGE_OPTIONSMENU_BUTTON_DOWN_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_DOWN_RGB;
      
      public static const IMAGE_UPSELL_BUTTON_REDX_DOWN:String = "IMAGE_UPSELL_BUTTON_REDX_DOWN";
      
      public static const IMAGE_UPSELL_BUTTON_GETIT_DOWN:String = "IMAGE_UPSELL_BUTTON_GETIT_DOWN";
      
      private static const IMAGE_BLOOM_ACCURACY_WHITE_ALPHA:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_WHITE_ALPHA;
      
      public static const IMAGE_DEATHSKULL_JAW:String = "IMAGE_DEATHSKULL_JAW";
      
      public static const IMAGE_BALL_YELLOW:String = "IMAGE_BALL_YELLOW";
      
      private static const IMAGE_DEATHSKULL_LARGE_MIDDLE_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_LARGE_MIDDLE_RGB;
      
      private static const IMAGE_BLOOM_REVERSE_GREEN_RGB:Class = Zuma2Images_IMAGE_BLOOM_REVERSE_GREEN_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_UP_RGB;
      
      private static const IMAGE_BLOOM_ACCURACY_BLUE_ALPHA:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_BLUE_ALPHA;
      
      private static const IMAGE_DEATHSKULL_HOLE_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_HOLE_RGB;
      
      public static const IMAGE_UPSELL_BUTTON_REDX_UP:String = "IMAGE_UPSELL_BUTTON_REDX_UP";
      
      public static const IMAGE_HELPSCREEN_BACKGROUND2:String = "IMAGE_HELPSCREEN_BACKGROUND2";
      
      public static const IMAGE_HELPSCREEN_BACKGROUND3:String = "IMAGE_HELPSCREEN_BACKGROUND3";
      
      public static const IMAGE_HELPSCREEN_BUTTON_CONTINUE_DOWN:String = "IMAGE_HELPSCREEN_BUTTON_CONTINUE_DOWN";
      
      private static const IMAGE_BACKGROUND_LEVEL4_TUNNEL2_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL4_TUNNEL2_RGB;
      
      public static const IMAGE_BACKGROUND_LEVEL4_TUNNEL1:String = "IMAGE_BACKGROUND_LEVEL4_TUNNEL1";
      
      private static const IMAGE_DOT_PURPLE_RGB:Class = Zuma2Images_IMAGE_DOT_PURPLE_RGB;
      
      public static const IMAGE_BACKGROUND_LEVEL4_TUNNEL2:String = "IMAGE_BACKGROUND_LEVEL4_TUNNEL2";
      
      private static const IMAGE_HELPSCREEN_BUTTON_DONTSHOW_OVER_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_DONTSHOW_OVER_RGB;
      
      private static const IMAGE_DIALOG_BACKGROUND_ALPHA:Class = Zuma2Images_IMAGE_DIALOG_BACKGROUND_ALPHA;
      
      public static const IMAGE_FROG_EYES:String = "IMAGE_FROG_EYES";
      
      public static const IMAGE_UPSELL_FULL:String = "IMAGE_UPSELL_FULL";
      
      public static const IMAGE_POWERUP_PURPLE:String = "IMAGE_POWERUP_PURPLE";
      
      private static const IMAGE_OPTIONSMENU_BUTTON_RESTART_UP_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_RESTART_UP_RGB;
      
      private static const IMAGE_BLOOM_ACCURACY_PURPLE_ALPHA:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_PURPLE_ALPHA;
      
      public static const IMAGE_FROG_BOTTOM:String = "IMAGE_FROG_BOTTOM";
      
      private static const IMAGE_BLOOM_BLAST_RED_RGB:Class = Zuma2Images_IMAGE_BLOOM_BLAST_RED_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_DOWN:String = "IMAGE_OPTIONSMENU_BUTTON_DOWN";
      
      private static const IMAGE_MAINMENU_BUTTON_DOWN_ALPHA:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_DOWN_ALPHA;
      
      public static const IMAGE_HELPSCREEN_BUTTON_CONTINUE_OVER:String = "IMAGE_HELPSCREEN_BUTTON_CONTINUE_OVER";
      
      public static const IMAGE_HELPSCREEN_BUTTON_CONTINUE_UP:String = "IMAGE_HELPSCREEN_BUTTON_CONTINUE_UP";
      
      private static const IMAGE_STAT_SCREEN_SPLAT_ALPHA:Class = Zuma2Images_IMAGE_STAT_SCREEN_SPLAT_ALPHA;
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_OVER_RGB;
      
      private static const IMAGE_FROG_CANNON_EYES_RGB:Class = Zuma2Images_IMAGE_FROG_CANNON_EYES_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_HELP_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_HELP_UP_RGB;
      
      private static const IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_BACK_DOWN_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_BACK_DOWN_RGB;
      
      public static const IMAGE_UI_LIVES_FRAME:String = "IMAGE_UI_LIVES_FRAME";
      
      private static const IMAGE_BLOOM_ACCURACY_PURPLE_RGB:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_PURPLE_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_DOWN:String = "IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_DOWN";
      
      private static const IMAGE_FROG_CANNON_TOP_RGB:Class = Zuma2Images_IMAGE_FROG_CANNON_TOP_RGB;
      
      private static const IMAGE_BALL_RED_EXPLOSION_RGB:Class = Zuma2Images_IMAGE_BALL_RED_EXPLOSION_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_OVER:String = "IMAGE_OPTIONSMENU_BUTTON_OVER";
      
      private static const IMAGE_HELPSCREEN_BACKGROUND3_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BACKGROUND3_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER_RGB;
      
      public static const IMAGE_BALL_RING:String = "IMAGE_BALL_RING";
      
      private static const IMAGE_FRUIT_GLOW_RGB:Class = Zuma2Images_IMAGE_FRUIT_GLOW_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL4_TUNNEL1_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL4_TUNNEL1_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_OVER_RGB;
      
      private static const IMAGE_TRANSITION_BAMBOO_TOP_RGB:Class = Zuma2Images_IMAGE_TRANSITION_BAMBOO_TOP_RGB;
      
      public static const IMAGE_DIALOG_BACKGROUND:String = "IMAGE_DIALOG_BACKGROUND";
      
      private static const IMAGE_FROG_CANNON_CHEVRONS_ALPHA:Class = Zuma2Images_IMAGE_FROG_CANNON_CHEVRONS_ALPHA;
      
      public static const IMAGE_UI_LIVES_FROG:String = "IMAGE_UI_LIVES_FROG";
      
      private static const IMAGE_DIALOG_BUTTON_ALPHA:Class = Zuma2Images_IMAGE_DIALOG_BUTTON_ALPHA;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_SOUND_ALPHA:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_SOUND_ALPHA;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_OVER:String = "IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_OVER";
      
      private static const IMAGE_BALL_WHITE_EXPLOSION_ALPHA:Class = Zuma2Images_IMAGE_BALL_WHITE_EXPLOSION_ALPHA;
      
      private static const IMAGE_BLOOM_ACCURACY_RED_ALPHA:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_RED_ALPHA;
      
      public static const IMAGE_BLOOM_ACCURACY_RED:String = "IMAGE_BLOOM_ACCURACY_RED";
      
      public static const IMAGE_BALL_BLUE_EXPLOSION:String = "IMAGE_BALL_BLUE_EXPLOSION";
      
      private static const IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND_RGB;
      
      private static const IMAGE_POWERUP_POWERPULSES_RGB:Class = Zuma2Images_IMAGE_POWERUP_POWERPULSES_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_SOUND_OFF_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_SOUND_OFF_UP_RGB;
      
      private static const IMAGE_SKULLPATH_LIT_RGB:Class = Zuma2Images_IMAGE_SKULLPATH_LIT_RGB;
      
      private static const IMAGE_POWERUP_ALPHA:Class = Zuma2Images_IMAGE_POWERUP_ALPHA;
      
      private static const IMAGE_OPTIONSMENU_BACKGROUND_ALPHA:Class = Zuma2Images_IMAGE_OPTIONSMENU_BACKGROUND_ALPHA;
      
      private static const IMAGE_INGAME_MENUBUTTON_UP_RGB:Class = Zuma2Images_IMAGE_INGAME_MENUBUTTON_UP_RGB;
      
      private static const IMAGE_DOT_YELLOW_RGB:Class = Zuma2Images_IMAGE_DOT_YELLOW_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL3_TUNNEL1_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL3_TUNNEL1_ALPHA;
      
      public static const IMAGE_BLOOM_STOP_GREEN:String = "IMAGE_BLOOM_STOP_GREEN";
      
      private static const IMAGE_UPSELL_BUTTON_GETIT_UP_RGB:Class = Zuma2Images_IMAGE_UPSELL_BUTTON_GETIT_UP_RGB;
      
      public static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN:String = "IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN";
      
      public static const IMAGE_MAINMENU_BUTTON_HELP_DOWN:String = "IMAGE_MAINMENU_BUTTON_HELP_DOWN";
      
      private static const IMAGE_DEATHSKULL_LARGE_BLACK_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_LARGE_BLACK_RGB;
      
      public static const IMAGE_UPSELL_BUTTON_GETIT_UP:String = "IMAGE_UPSELL_BUTTON_GETIT_UP";
      
      private static const IMAGE_HIGHSCORES_BUTTON_MENU_OVER_RGB:Class = Zuma2Images_IMAGE_HIGHSCORES_BUTTON_MENU_OVER_RGB;
      
      public static const IMAGE_SKULLPATH:String = "IMAGE_SKULLPATH";
      
      private static const IMAGE_DEATHSKULL_HEAD_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_HEAD_RGB;
      
      private static const IMAGE_HELPSCREEN_BUTTON_DONTSHOW_DOWN_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_DONTSHOW_DOWN_RGB;
      
      private static const IMAGE_BALL_YELLOW_EXPLOSION_ALPHA:Class = Zuma2Images_IMAGE_BALL_YELLOW_EXPLOSION_ALPHA;
      
      public static const IMAGE_HIGHSCORES_BUTTON_MENU_UP:String = "IMAGE_HIGHSCORES_BUTTON_MENU_UP";
      
      private static const IMAGE_HELPSCREEN_BACKGROUND2_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BACKGROUND2_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_DOWN_RGB;
      
      public static const IMAGE_TRANSITION_BAMBOO_BOTTOM:String = "IMAGE_TRANSITION_BAMBOO_BOTTOM";
      
      public static const IMAGE_BLOOM_REVERSE_YELLOW:String = "IMAGE_BLOOM_REVERSE_YELLOW";
      
      private static const IMAGE_MAINMENU_BUTTON_HELP_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_HELP_OVER_RGB;
      
      public static const IMAGE_FROG_TONGUE:String = "IMAGE_FROG_TONGUE";
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER_RGB;
      
      public static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER:String = "IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER";
      
      public static const IMAGE_BACKGROUND_LEVEL3_TUNNEL1:String = "IMAGE_BACKGROUND_LEVEL3_TUNNEL1";
      
      public static const IMAGE_BACKGROUND_LEVEL3_TUNNEL2:String = "IMAGE_BACKGROUND_LEVEL3_TUNNEL2";
      
      public static const IMAGE_MAINMENU_BUTTON_HELP_OVER:String = "IMAGE_MAINMENU_BUTTON_HELP_OVER";
      
      private static const IMAGE_BOMB_EXPLOSION_RGB:Class = Zuma2Images_IMAGE_BOMB_EXPLOSION_RGB;
      
      private static const IMAGE_UPSELL_ADVENTURE_RGB:Class = Zuma2Images_IMAGE_UPSELL_ADVENTURE_RGB;
      
      public static const IMAGE_BLOOM_REVERSE_RED:String = "IMAGE_BLOOM_REVERSE_RED";
      
      private static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN_ALPHA:Class = Zuma2Images_IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN_ALPHA;
      
      public static const IMAGE_HELPSCREEN_BUTTON_PAGE1_UP:String = "IMAGE_HELPSCREEN_BUTTON_PAGE1_UP";
      
      public static const IMAGE_BLOOM_BLAST_YELLOW:String = "IMAGE_BLOOM_BLAST_YELLOW";
      
      public static const IMAGE_DIALOG_BUTTON_NO_UP:String = "IMAGE_DIALOG_BUTTON_NO_UP";
      
      public static const IMAGE_BALL_YELLOW_EXPLOSION:String = "IMAGE_BALL_YELLOW_EXPLOSION";
      
      public static const IMAGE_BLOOM_BLAST_RED:String = "IMAGE_BLOOM_BLAST_RED";
      
      private static const IMAGE_TRANSITION_BAMBOO_BOTTOM_ALPHA:Class = Zuma2Images_IMAGE_TRANSITION_BAMBOO_BOTTOM_ALPHA;
      
      private static const IMAGE_MAINMENU_BUTTON_BACKGROUND_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_BACKGROUND_UP_RGB;
      
      private static const IMAGE_BLOOM_ACCURACY_YELLOW_RGB:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_YELLOW_RGB;
      
      public static const IMAGE_DEATHSKULL_LARGE_TOP:String = "IMAGE_DEATHSKULL_LARGE_TOP";
      
      private static const IMAGE_FRUIT_ACORN_GLOW_RGB:Class = Zuma2Images_IMAGE_FRUIT_ACORN_GLOW_RGB;
      
      private static const IMAGE_DEATHSKULL_LARGE_MIDDLE_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_LARGE_MIDDLE_ALPHA;
      
      public static const IMAGE_DEATHSKULL_LARGE_MIDDLE:String = "IMAGE_DEATHSKULL_LARGE_MIDDLE";
      
      public static const IMAGE_UI_BAR:String = "IMAGE_UI_BAR";
      
      public static const IMAGE_BALL_WHITE:String = "IMAGE_BALL_WHITE";
      
      private static const IMAGE_DEATHSKULL_BASE_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_BASE_RGB;
      
      private static const IMAGE_FROG_CANNON_EYES_ALPHA:Class = Zuma2Images_IMAGE_FROG_CANNON_EYES_ALPHA;
      
      private static const IMAGE_PATH_EXPLOSION_RGB:Class = Zuma2Images_IMAGE_PATH_EXPLOSION_RGB;
      
      private static const IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER_RGB;
      
      public static const IMAGE_BLOOM_BLAST_GREEN:String = "IMAGE_BLOOM_BLAST_GREEN";
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_DOWN_RGB;
      
      private static const IMAGE_DEATHSKULL_LARGE_BOTTOM_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_LARGE_BOTTOM_ALPHA;
      
      public static const IMAGE_DEATHSKULL_LARGE_BLACK:String = "IMAGE_DEATHSKULL_LARGE_BLACK";
      
      public static const IMAGE_FROG_CANNON_TOP:String = "IMAGE_FROG_CANNON_TOP";
      
      public static const IMAGE_HELPSCREEN_BUTTON_DONTSHOW_UP:String = "IMAGE_HELPSCREEN_BUTTON_DONTSHOW_UP";
      
      public static const IMAGE_DOT_WHITE:String = "IMAGE_DOT_WHITE";
      
      private static const IMAGE_BLOOM_BLAST_WHITE_RGB:Class = Zuma2Images_IMAGE_BLOOM_BLAST_WHITE_RGB;
      
      public static const IMAGE_UI_TIMERBAR_EMPTY:String = "IMAGE_UI_TIMERBAR_EMPTY";
      
      private static const IMAGE_DEATHSKULL_JAW_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_JAW_ALPHA;
      
      private static const IMAGE_BACKGROUND_LEVEL3_TUNNEL2_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL3_TUNNEL2_RGB;
      
      public static const IMAGE_POWERUP_BLUE:String = "IMAGE_POWERUP_BLUE";
      
      private static const IMAGE_HELPSCREEN_BUTTON_PAGE1_UP_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_PAGE1_UP_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_SOUND_ON_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_SOUND_ON_UP_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER_RGB;
      
      private static const IMAGE_HIGHSCORES_BUTTON_MENU_DOWN_RGB:Class = Zuma2Images_IMAGE_HIGHSCORES_BUTTON_MENU_DOWN_RGB;
      
      public static const IMAGE_BLOOM_ACCURACY_WHITE:String = "IMAGE_BLOOM_ACCURACY_WHITE";
      
      private static const IMAGE_BLOOM_STOP_PURPLE_RGB:Class = Zuma2Images_IMAGE_BLOOM_STOP_PURPLE_RGB;
      
      private static const IMAGE_HELPSCREEN_BACKGROUND_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BACKGROUND_RGB;
      
      private static const IMAGE_LEVELBACKGROUND_VOLCANO1_CHUTE1_RGB:Class = Zuma2Images_IMAGE_LEVELBACKGROUND_VOLCANO1_CHUTE1_RGB;
      
      private static const IMAGE_BLOOM_STOP_GREEN_RGB:Class = Zuma2Images_IMAGE_BLOOM_STOP_GREEN_RGB;
      
      private static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP_RGB:Class = Zuma2Images_IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP_RGB;
      
      private static const IMAGE_BALL_CANNON_ALPHA:Class = Zuma2Images_IMAGE_BALL_CANNON_ALPHA;
      
      private static const IMAGE_FRUIT_GLOW_ALPHA:Class = Zuma2Images_IMAGE_FRUIT_GLOW_ALPHA;
      
      private static const IMAGE_UPSELL_BUTTON_REDX_UP_RGB:Class = Zuma2Images_IMAGE_UPSELL_BUTTON_REDX_UP_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL2_TUNNEL2_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL2_TUNNEL2_ALPHA;
      
      private static const IMAGE_MAINMENU_BUTTON_HELP_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_HELP_DOWN_RGB;
      
      private static const IMAGE_HIGHSCORES_BUTTON_MENU_UP_RGB:Class = Zuma2Images_IMAGE_HIGHSCORES_BUTTON_MENU_UP_RGB;
      
      public static const IMAGE_HELPSCREEN_BUTTON_PAGE3_UP:String = "IMAGE_HELPSCREEN_BUTTON_PAGE3_UP";
      
      private static const IMAGE_BLOOM_REVERSE_WHITE_RGB:Class = Zuma2Images_IMAGE_BLOOM_REVERSE_WHITE_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_UP:String = "IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_UP";
      
      public static const IMAGE_DEATHSKULL_LARGE_BOTTOM:String = "IMAGE_DEATHSKULL_LARGE_BOTTOM";
      
      private static const IMAGE_BALL_RED_EXPLOSION_ALPHA:Class = Zuma2Images_IMAGE_BALL_RED_EXPLOSION_ALPHA;
      
      private static const IMAGE_BLOOM_ACCURACY_GREEN_RGB:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_GREEN_RGB;
      
      public static const IMAGE_BALL_RED_EXPLOSION:String = "IMAGE_BALL_RED_EXPLOSION";
      
      private static const IMAGE_BACKGROUND_LEVEL3_TUNNEL1_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL3_TUNNEL1_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN_RGB;
      
      private static const IMAGE_SKULLPATH__LIT_ALPHA:Class = Zuma2Images_IMAGE_SKULLPATH__LIT_ALPHA;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_BACK_UP_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_BACK_UP_RGB;
      
      private static const IMAGE_DIALOG_BUTTON_YES_UP_RGB:Class = Zuma2Images_IMAGE_DIALOG_BUTTON_YES_UP_RGB;
      
      public static const IMAGE_UPSELL_BUTTON_PURPLEX_UP:String = "IMAGE_UPSELL_BUTTON_PURPLEX_UP";
      
      public static const IMAGE_BACKGROUND_LEVEL2_TUNNEL1:String = "IMAGE_BACKGROUND_LEVEL2_TUNNEL1";
      
      public static const IMAGE_BACKGROUND_LEVEL2_TUNNEL2:String = "IMAGE_BACKGROUND_LEVEL2_TUNNEL2";
      
      public static const IMAGE_DIALOG_BUTTON_YES_DOWN:String = "IMAGE_DIALOG_BUTTON_YES_DOWN";
      
      private static const IMAGE_POWERUP_GREEN_RGB:Class = Zuma2Images_IMAGE_POWERUP_GREEN_RGB;
      
      public static const IMAGE_BLOOM_STOP_BLUE:String = "IMAGE_BLOOM_STOP_BLUE";
      
      public static const IMAGE_BLOOM_ACCURACY_YELLOW:String = "IMAGE_BLOOM_ACCURACY_YELLOW";
      
      private static const IMAGE_BALL_YELLOW_EXPLOSION_RGB:Class = Zuma2Images_IMAGE_BALL_YELLOW_EXPLOSION_RGB;
      
      public static const IMAGE_DIALOG_BUTTON_NO_DOWN:String = "IMAGE_DIALOG_BUTTON_NO_DOWN";
      
      private static const IMAGE_HELPSCREEN_BUTTON_CONTINUE_UP_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_CONTINUE_UP_RGB;
      
      private static const IMAGE_STAT_SCREEN_BACKGROUND_RGB:Class = Zuma2Images_IMAGE_STAT_SCREEN_BACKGROUND_RGB;
      
      public static const IMAGE_MAINMENU_BACKGROUND:String = "IMAGE_MAINMENU_BACKGROUND";
      
      public static const IMAGE_DOT_BLUE:String = "IMAGE_DOT_BLUE";
      
      private static const IMAGE_BLOOM_BLAST_BLUE_RGB:Class = Zuma2Images_IMAGE_BLOOM_BLAST_BLUE_RGB;
      
      public static const IMAGE_BLOOM_STOP_PURPLE:String = "IMAGE_BLOOM_STOP_PURPLE";
      
      private static const IMAGE_DEATHSKULL_LARGE_TOP_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_LARGE_TOP_ALPHA;
      
      public static const IMAGE_DIALOG_BUTTON_YES_OVER:String = "IMAGE_DIALOG_BUTTON_YES_OVER";
      
      public static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP:String = "IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP";
      
      private static const IMAGE_DIALOG_BUTTON_NO_OVER_RGB:Class = Zuma2Images_IMAGE_DIALOG_BUTTON_NO_OVER_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP_ALPHA;
      
      public static const IMAGE_DIALOG_BUTTON_NO_OVER:String = "IMAGE_DIALOG_BUTTON_NO_OVER";
      
      private static const IMAGE_OPTIONSMENU_BUTTON_HELP_OVER_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_HELP_OVER_RGB;
      
      private static const IMAGE_BLOOM_STOP_YELLOW_RGB:Class = Zuma2Images_IMAGE_BLOOM_STOP_YELLOW_RGB;
      
      public static const IMAGE_UI_MENUBUTTON_UP:String = "IMAGE_UI_MENUBUTTON_UP";
      
      private static const IMAGE_BALL_GREEN_EXPLOSION_RGB:Class = Zuma2Images_IMAGE_BALL_GREEN_EXPLOSION_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL5_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL5_RGB;
      
      public static const IMAGE_BALL_PURPLE_EXPLOSION:String = "IMAGE_BALL_PURPLE_EXPLOSION";
      
      public static const IMAGE_FRUIT_GLOW:String = "IMAGE_FRUIT_GLOW";
      
      private static const IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER_RGB;
      
      public static const IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP:String = "IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP";
      
      public static const IMAGE_FROG_CANNON_CHEVRONS:String = "IMAGE_FROG_CANNON_CHEVRONS";
      
      private static const IMAGE_BLOOM_STOP_BLUE_RGB:Class = Zuma2Images_IMAGE_BLOOM_STOP_BLUE_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN:String = "IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN";
      
      public static const IMAGE_BALL_WHITE_EXPLOSION:String = "IMAGE_BALL_WHITE_EXPLOSION";
      
      public static const IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER:String = "IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER";
      
      private static const IMAGE_OPTIONSMENU_BUTTON_ALPHA:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_ALPHA;
      
      public static const IMAGE_POWERUP_POWERPULSES:String = "IMAGE_POWERUP_POWERPULSES";
      
      public static const IMAGE_FROG_TOP:String = "IMAGE_FROG_TOP";
      
      private static const IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER_RGB;
      
      private static const IMAGE_UI_SCORENUMBERS_RGB:Class = Zuma2Images_IMAGE_UI_SCORENUMBERS_RGB;
      
      public static const IMAGE_BALL_RED:String = "IMAGE_BALL_RED";
      
      public static const IMAGE_FROG_CANNON_EYES:String = "IMAGE_FROG_CANNON_EYES";
      
      private static const IMAGE_BLOOM_ACCURACY_YELLOW_ALPHA:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_YELLOW_ALPHA;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_DOWN:String = "IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_DOWN";
      
      private static const IMAGE_DEATHSKULL_LARGE_BLACK_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_LARGE_BLACK_ALPHA;
      
      private static const IMAGE_BACKGROUND_LEVEL4_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL4_RGB;
      
      private static const IMAGE_BALL_PURPLE_RGB:Class = Zuma2Images_IMAGE_BALL_PURPLE_RGB;
      
      private static const IMAGE_UI_LIVES_FROG_RGB:Class = Zuma2Images_IMAGE_UI_LIVES_FROG_RGB;
      
      public static const IMAGE_PATH_SPARKLES:String = "IMAGE_PATH_SPARKLES";
      
      private static const IMAGE_BACKGROUND_LEVEL2_TUNNEL2_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL2_TUNNEL2_RGB;
      
      public static const IMAGE_BALL_PURPLE:String = "IMAGE_BALL_PURPLE";
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_OVER_RGB;
      
      public static const IMAGE_BACKGROUND_LEVEL1_TUNNEL1:String = "IMAGE_BACKGROUND_LEVEL1_TUNNEL1";
      
      private static const IMAGE_UI_TIMERBAR_FULL_RGB:Class = Zuma2Images_IMAGE_UI_TIMERBAR_FULL_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_OVER_RGB;
      
      private static const IMAGE_BLOOM_REVERSE_RED_RGB:Class = Zuma2Images_IMAGE_BLOOM_REVERSE_RED_RGB;
      
      public static const IMAGE_BLOOM_STOP_RED:String = "IMAGE_BLOOM_STOP_RED";
      
      private static const IMAGE_BACKGROUND_LEVEL4_TUNNEL1_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL4_TUNNEL1_ALPHA;
      
      private static const IMAGE_FROG_BOTTOM_RGB:Class = Zuma2Images_IMAGE_FROG_BOTTOM_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_OVER:String = "IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_OVER";
      
      private static const IMAGE_DIALOG_BUTTON_NO_DOWN_RGB:Class = Zuma2Images_IMAGE_DIALOG_BUTTON_NO_DOWN_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_HELP_DOWN_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_HELP_DOWN_RGB;
      
      public static const IMAGE_LEVELBACKGROUND_VOLCANO1:String = "IMAGE_LEVELBACKGROUND_VOLCANO1";
      
      private static const IMAGE_BALL_GLOW_RGB:Class = Zuma2Images_IMAGE_BALL_GLOW_RGB;
      
      public static const IMAGE_STAT_SCREEN_BACKGROUND:String = "IMAGE_STAT_SCREEN_BACKGROUND";
      
      private static const IMAGE_DIALOG_BUTTON_YES_OVER_RGB:Class = Zuma2Images_IMAGE_DIALOG_BUTTON_YES_OVER_RGB;
      
      private static const IMAGE_HELPSCREEN_BUTTON_PAGE3_UP_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_PAGE3_UP_RGB;
      
      public static const IMAGE_POWERUP_WHITE:String = "IMAGE_POWERUP_WHITE";
      
      private static const IMAGE_FRUIT_ACORN_RGB:Class = Zuma2Images_IMAGE_FRUIT_ACORN_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_UP:String = "IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_UP";
      
      public static const IMAGE_OPTIONSMENU_BACKGROUND:String = "IMAGE_OPTIONSMENU_BACKGROUND";
      
      public static const IMAGE_DOT_RED:String = "IMAGE_DOT_RED";
      
      private static const IMAGE_BACKGROUND_LEVEL3_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL3_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_HELP_UP:String = "IMAGE_OPTIONSMENU_BUTTON_HELP_UP";
      
      private static const IMAGE_BACKGROUND_LEVEL2_TUNNEL1_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL2_TUNNEL1_RGB;
      
      public static const IMAGE_UPSELL_CHALLENGE:String = "IMAGE_UPSELL_CHALLENGE";
      
      private static const IMAGE_POWERUP_REVERSE_PULSE_ALPHA:Class = Zuma2Images_IMAGE_POWERUP_REVERSE_PULSE_ALPHA;
      
      public static const IMAGE_BLOOM_ACCURACY_BLUE:String = "IMAGE_BLOOM_ACCURACY_BLUE";
      
      public static const IMAGE_UPSELL_BUTTON_PURPLEX_DOWN:String = "IMAGE_UPSELL_BUTTON_PURPLEX_DOWN";
      
      private static const IMAGE_DEATHSKULL_HOLE_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_HOLE_ALPHA;
      
      public static const IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP:String = "IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP";
      
      public static const IMAGE_UI_TIMERBAR_FULL:String = "IMAGE_UI_TIMERBAR_FULL";
      
      private static const IMAGE_BALL_YELLOW_RGB:Class = Zuma2Images_IMAGE_BALL_YELLOW_RGB;
      
      private static const IMAGE_BALL_CANNON_RGB:Class = Zuma2Images_IMAGE_BALL_CANNON_RGB;
      
      private static const IMAGE_BLOOM_REVERSE_PURPLE_RGB:Class = Zuma2Images_IMAGE_BLOOM_REVERSE_PURPLE_RGB;
      
      private static const IMAGE_DOT_GREEN_RGB:Class = Zuma2Images_IMAGE_DOT_GREEN_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_HELP_DOWN:String = "IMAGE_OPTIONSMENU_BUTTON_HELP_DOWN";
      
      private static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER_ALPHA:Class = Zuma2Images_IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER_ALPHA;
      
      public static const IMAGE_HELPSCREEN_BACKGROUND:String = "IMAGE_HELPSCREEN_BACKGROUND";
      
      private static const IMAGE_DOT_RED_RGB:Class = Zuma2Images_IMAGE_DOT_RED_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_DOWN_RGB;
      
      public static const IMAGE_BALL_GLOW:String = "IMAGE_BALL_GLOW";
      
      public static const IMAGE_DOT_YELLOW:String = "IMAGE_DOT_YELLOW";
      
      public static const IMAGE_MAINMENU_BUTTON_HELP_UP:String = "IMAGE_MAINMENU_BUTTON_HELP_UP";
      
      private static const IMAGE_UI_TIMERBAR_EMPTY_RGB:Class = Zuma2Images_IMAGE_UI_TIMERBAR_EMPTY_RGB;
      
      private static const IMAGE_BALL_BLUE_EXPLOSION_ALPHA:Class = Zuma2Images_IMAGE_BALL_BLUE_EXPLOSION_ALPHA;
      
      private static const IMAGE_MAINMENU_BUTTON_SOUND_OFF_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_SOUND_OFF_OVER_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_DOWN_RGB;
      
      private static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP_ALPHA:Class = Zuma2Images_IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP_ALPHA;
      
      private static const IMAGE_BLOOM_STOP_WHITE_RGB:Class = Zuma2Images_IMAGE_BLOOM_STOP_WHITE_RGB;
      
      private static const IMAGE_POWERUP_RED_RGB:Class = Zuma2Images_IMAGE_POWERUP_RED_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_UP:String = "IMAGE_OPTIONSMENU_BUTTON_UP";
      
      public static const IMAGE_OPTIONSMENU_BUTTON_HELP_OVER:String = "IMAGE_OPTIONSMENU_BUTTON_HELP_OVER";
      
      public static const IMAGE_BLOOM_REVERSE_WHITE:String = "IMAGE_BLOOM_REVERSE_WHITE";
      
      private static const IMAGE_INGAME_MENUBUTTON_OVER_RGB:Class = Zuma2Images_IMAGE_INGAME_MENUBUTTON_OVER_RGB;
      
      private static const IMAGE_DIALOG_BACKGROUND_RGB:Class = Zuma2Images_IMAGE_DIALOG_BACKGROUND_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL2_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL2_RGB;
      
      private static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER_RGB:Class = Zuma2Images_IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER_RGB;
      
      private static const IMAGE_DIALOG_BUTTON_YES_DOWN_RGB:Class = Zuma2Images_IMAGE_DIALOG_BUTTON_YES_DOWN_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL3_TUNNEL2_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL3_TUNNEL2_ALPHA;
      
      private static const IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER_ALPHA;
      
      public static const IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER:String = "IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER";
      
      private static const IMAGE_UPSELL_BUTTON_GETIT_DOWN_RGB:Class = Zuma2Images_IMAGE_UPSELL_BUTTON_GETIT_DOWN_RGB;
      
      private static const IMAGE_BLOOM_ACCURACY_WHITE_RGB:Class = Zuma2Images_IMAGE_BLOOM_ACCURACY_WHITE_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_UP:String = "IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_UP";
      
      public static const IMAGE_OPTIONSMENU_BUTTON_BACK_UP:String = "IMAGE_OPTIONSMENU_BUTTON_BACK_UP";
      
      public static const IMAGE_BLOOM_REVERSE_BLUE:String = "IMAGE_BLOOM_REVERSE_BLUE";
      
      private static const IMAGE_OPTIONSMENU_BUTTON_RESTART_OVER_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_RESTART_OVER_RGB;
      
      private static const IMAGE_BALL_RED_RGB:Class = Zuma2Images_IMAGE_BALL_RED_RGB;
      
      public static const IMAGE_BALL_GREEN:String = "IMAGE_BALL_GREEN";
      
      public static const IMAGE_HIGHSCORES_BUTTON_MENU_DOWN:String = "IMAGE_HIGHSCORES_BUTTON_MENU_DOWN";
      
      private static const IMAGE_DOT_BLUE_RGB:Class = Zuma2Images_IMAGE_DOT_BLUE_RGB;
      
      private static const IMAGE_POWERUP_WHITE_RGB:Class = Zuma2Images_IMAGE_POWERUP_WHITE_RGB;
      
      public static const IMAGE_BALL_CANNON:String = "IMAGE_BALL_CANNON";
      
      private static const IMAGE_BALL_PURPLE_EXPLOSION_ALPHA:Class = Zuma2Images_IMAGE_BALL_PURPLE_EXPLOSION_ALPHA;
      
      public static const IMAGE_BLOOM_REVERSE_PURPLE:String = "IMAGE_BLOOM_REVERSE_PURPLE";
      
      private static const IMAGE_BACKGROUND_LEVEL1_TUNNEL1_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL1_TUNNEL1_ALPHA;
      
      public static const IMAGE_DOT_GREEN:String = "IMAGE_DOT_GREEN";
      
      public static const IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER:String = "IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER";
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_DOWN:String = "IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_DOWN";
      
      public static const IMAGE_FRUIT_ACORN:String = "IMAGE_FRUIT_ACORN";
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_DOWN:String = "IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_DOWN";
      
      public static const IMAGE_HIGHSCORES_BUTTON_MENU_OVER:String = "IMAGE_HIGHSCORES_BUTTON_MENU_OVER";
      
      public static const IMAGE_BLOOM_BLAST_PURPLE:String = "IMAGE_BLOOM_BLAST_PURPLE";
      
      private static const IMAGE_DEATHSKULL_FIRERING_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_FIRERING_RGB;
      
      private static const IMAGE_BACKGROUND_LEVEL1_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL1_RGB;
      
      private static const IMAGE_BLOOM_REVERSE_YELLOW_RGB:Class = Zuma2Images_IMAGE_BLOOM_REVERSE_YELLOW_RGB;
      
      public static const IMAGE_STAT_SCREEN_SPLAT:String = "IMAGE_STAT_SCREEN_SPLAT";
      
      public static const IMAGE_DEATHSKULL_FIRERING:String = "IMAGE_DEATHSKULL_FIRERING";
      
      public static const IMAGE_BLOOM_ACCURACY_GREEN:String = "IMAGE_BLOOM_ACCURACY_GREEN";
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_OVER:String = "IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_OVER";
      
      private static const IMAGE_BLOOM_REVERSE_BLUE_RGB:Class = Zuma2Images_IMAGE_BLOOM_REVERSE_BLUE_RGB;
      
      public static const IMAGE_DIALOG_BUTTON_YES_UP:String = "IMAGE_DIALOG_BUTTON_YES_UP";
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER:String = "IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER";
      
      public static const IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED:String = "IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED";
      
      private static const IMAGE_UI_BAR_ALPHA:Class = Zuma2Images_IMAGE_UI_BAR_ALPHA;
      
      private static const IMAGE_BALL_GREEN_RGB:Class = Zuma2Images_IMAGE_BALL_GREEN_RGB;
      
      public static const IMAGE_TRANSITION_BAMBOO_TOP:String = "IMAGE_TRANSITION_BAMBOO_TOP";
      
      private static const IMAGE_POWERUP_PURPLE_RGB:Class = Zuma2Images_IMAGE_POWERUP_PURPLE_RGB;
      
      public static const IMAGE_UPSELL_HEROIC:String = "IMAGE_UPSELL_HEROIC";
      
      private static const IMAGE_DEATHSKULL_JAW_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_JAW_RGB;
      
      public static const IMAGE_HIGHSCORES_BACKGROUND:String = "IMAGE_HIGHSCORES_BACKGROUND";
      
      private static const IMAGE_MAINMENU_BUTTON_SOUND_OFF_DOWN_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_SOUND_OFF_DOWN_RGB;
      
      private static const IMAGE_DEATHSKULL_HEAD_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_HEAD_ALPHA;
      
      private static const IMAGE_INGAME_MENUBUTTON_DOWN_RGB:Class = Zuma2Images_IMAGE_INGAME_MENUBUTTON_DOWN_RGB;
      
      private static const IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN_RGB:Class = Zuma2Images_IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_PLAY_DOWN:String = "IMAGE_MAINMENU_BUTTON_PLAY_DOWN";
      
      private static const IMAGE_TRANSITION_BAMBOO_TOP_ALPHA:Class = Zuma2Images_IMAGE_TRANSITION_BAMBOO_TOP_ALPHA;
      
      public static const IMAGE_DEATHSKULL_HOLE:String = "IMAGE_DEATHSKULL_HOLE";
      
      public static const IMAGE_POWERUP_YELLOW:String = "IMAGE_POWERUP_YELLOW";
      
      public static const IMAGE_BALL_GREEN_EXPLOSION:String = "IMAGE_BALL_GREEN_EXPLOSION";
      
      public static const IMAGE_PATH_EXPLOSION:String = "IMAGE_PATH_EXPLOSION";
      
      private static const IMAGE_DEATHSKULL_BASE_ALPHA:Class = Zuma2Images_IMAGE_DEATHSKULL_BASE_ALPHA;
      
      private static const IMAGE_UPSELL_CHALLENGE_RGB:Class = Zuma2Images_IMAGE_UPSELL_CHALLENGE_RGB;
      
      private static const IMAGE_TRANSITION_BAMBOO_BOTTOM_RGB:Class = Zuma2Images_IMAGE_TRANSITION_BAMBOO_BOTTOM_RGB;
      
      private static const IMAGE_OPTIONSMENU_BUTTON_RESTART_DOWN_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BUTTON_RESTART_DOWN_RGB;
      
      public static const IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER:String = "IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER";
      
      private static const IMAGE_FROG_CANNON_CHEVRONS_RGB:Class = Zuma2Images_IMAGE_FROG_CANNON_CHEVRONS_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_PLAY_OVER:String = "IMAGE_MAINMENU_BUTTON_PLAY_OVER";
      
      private static const IMAGE_BACKGROUND_LEVEL1_TUNNEL1_RGB:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL1_TUNNEL1_RGB;
      
      private static const IMAGE_BALL_WHITE_EXPLOSION_RGB:Class = Zuma2Images_IMAGE_BALL_WHITE_EXPLOSION_RGB;
      
      private static const IMAGE_HELPSCREEN_BUTTON_CONTINUE_ALPHA:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_CONTINUE_ALPHA;
      
      private static const IMAGE_BLOOM_STOP_RED_RGB:Class = Zuma2Images_IMAGE_BLOOM_STOP_RED_RGB;
      
      private static const IMAGE_MAINMENU_BUTTON_PLAY_UP_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_PLAY_UP_RGB;
      
      private static const IMAGE_FRUIT_ACORN_GLOW_ALPHA:Class = Zuma2Images_IMAGE_FRUIT_ACORN_GLOW_ALPHA;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_UP:String = "IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_UP";
      
      private static const IMAGE_FRUIT_ACORN_ALPHA:Class = Zuma2Images_IMAGE_FRUIT_ACORN_ALPHA;
      
      private static const IMAGE_HELPSCREEN_BUTTON_DONTSHOW_ALPHA:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_DONTSHOW_ALPHA;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_RESTART_UP:String = "IMAGE_OPTIONSMENU_BUTTON_RESTART_UP";
      
      private static const IMAGE_UI_LIVES_FRAME_RGB:Class = Zuma2Images_IMAGE_UI_LIVES_FRAME_RGB;
      
      public static const IMAGE_LEVELBACKGROUND_VOLCANO1_CHUTE1:String = "IMAGE_LEVELBACKGROUND_CHUTE1";
      
      private static const IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP_ALPHA:Class = Zuma2Images_IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP_ALPHA;
      
      private static const IMAGE_OPTIONSMENU_BACKGROUND_RGB:Class = Zuma2Images_IMAGE_OPTIONSMENU_BACKGROUND_RGB;
      
      public static const IMAGE_UI_LEVELS_FRAME:String = "IMAGE_UI_LEVELS_FRAME";
      
      public static const IMAGE_DOT_BLACK:String = "IMAGE_DOT_BLACK";
      
      private static const IMAGE_BACKGROUND_LEVEL5_TUNNEL1_ALPHA:Class = Zuma2Images_IMAGE_BACKGROUND_LEVEL5_TUNNEL1_ALPHA;
      
      private static const IMAGE_UI_MENUBUTTON_OVER_RGB:Class = Zuma2Images_IMAGE_UI_MENUBUTTON_OVER_RGB;
      
      private static const IMAGE_POWERUP_YELLOW_RGB:Class = Zuma2Images_IMAGE_POWERUP_YELLOW_RGB;
      
      private static const IMAGE_DEATHSKULL_LARGE_BOTTOM_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_LARGE_BOTTOM_RGB;
      
      private static const IMAGE_UI_MENUBUTTON_UP_RGB:Class = Zuma2Images_IMAGE_UI_MENUBUTTON_UP_RGB;
      
      private static const IMAGE_PATH_SPARKLES_RGB:Class = Zuma2Images_IMAGE_PATH_SPARKLES_RGB;
      
      public static const IMAGE_BLOOM_ACCURACY_PURPLE:String = "IMAGE_BLOOM_ACCURACY_PURPLE";
      
      private static const IMAGE_STAT_SCREEN_SPLAT_RGB:Class = Zuma2Images_IMAGE_STAT_SCREEN_SPLAT_RGB;
      
      private static const IMAGE_POWERUP_REVERSE_PULSE_RGB:Class = Zuma2Images_IMAGE_POWERUP_REVERSE_PULSE_RGB;
      
      private static const IMAGE_UPSELL_BUTTON_PURPLEX_DOWN_RGB:Class = Zuma2Images_IMAGE_UPSELL_BUTTON_PURPLEX_DOWN_RGB;
      
      public static const IMAGE_HELPSCREEN_BUTTON_PAGE2_UP:String = "IMAGE_HELPSCREEN_BUTTON_PAGE2_UP";
      
      private static const IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP_RGB:Class = Zuma2Images_IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_RESTART_DOWN:String = "IMAGE_OPTIONSMENU_BUTTON_RESTART_DOWN";
      
      public static const IMAGE_BACKGROUND_LEVEL1:String = "IMAGE_BACKGROUND_LEVEL1";
      
      public static const IMAGE_BACKGROUND_LEVEL2:String = "IMAGE_BACKGROUND_LEVEL2";
      
      public static const IMAGE_BACKGROUND_LEVEL3:String = "IMAGE_BACKGROUND_LEVEL3";
      
      public static const IMAGE_BACKGROUND_LEVEL4:String = "IMAGE_BACKGROUND_LEVEL4";
      
      public static const IMAGE_BACKGROUND_LEVEL5:String = "IMAGE_BACKGROUND_LEVEL5";
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_DOWN:String = "IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_DOWN";
      
      private static const IMAGE_CANNON_BLAST_RGB:Class = Zuma2Images_IMAGE_CANNON_BLAST_RGB;
      
      private static const IMAGE_UPSELL_FULL_RGB:Class = Zuma2Images_IMAGE_UPSELL_FULL_RGB;
      
      private static const IMAGE_DIALOG_BUTTON_NO_UP_RGB:Class = Zuma2Images_IMAGE_DIALOG_BUTTON_NO_UP_RGB;
      
      public static const IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER:String = "IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER";
      
      private static const IMAGE_HIGHSCORES_BACKGROUND_RGB:Class = Zuma2Images_IMAGE_HIGHSCORES_BACKGROUND_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED:String = "IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED";
      
      private static const IMAGE_HELPSCREEN_BUTTON_CONTINUE_OVER_RGB:Class = Zuma2Images_IMAGE_HELPSCREEN_BUTTON_CONTINUE_OVER_RGB;
      
      private static const IMAGE_MAINMENU_BACKGROUND_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BACKGROUND_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_RESTART_OVER:String = "IMAGE_OPTIONSMENU_BUTTON_RESTART_OVER";
      
      private static const IMAGE_DEATHSKULL_LARGE_TOP_RGB:Class = Zuma2Images_IMAGE_DEATHSKULL_LARGE_TOP_RGB;
      
      public static const IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_OVER:String = "IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_OVER";
      
      private static const IMAGE_MAINMENU_BUTTON_SOUND_ON_OVER_RGB:Class = Zuma2Images_IMAGE_MAINMENU_BUTTON_SOUND_ON_OVER_RGB;
      
      private static const IMAGE_SKULLPATH_RGB:Class = Zuma2Images_IMAGE_SKULLPATH_RGB;
      
      public static const IMAGE_OPTIONSMENU_BUTTON_BACK_DOWN:String = "IMAGE_OPTIONSMENU_BUTTON_BACK_DOWN";
      
      public static const IMAGE_FROG_CANNON_BOTTOM:String = "IMAGE_FROG_CANNON_BOTTOM";
      
      private static const IMAGE_PATH_EXPLOSION_ALPHA:Class = Zuma2Images_IMAGE_PATH_EXPLOSION_ALPHA;
      
      public static const IMAGE_BLOOM_STOP_WHITE:String = "IMAGE_BLOOM_STOP_WHITE";
      
      public static const IMAGE_DEATHSKULL_HEAD:String = "IMAGE_DEATHSKULL_HEAD";
      
      private static const IMAGE_DOT_WHITE_RGB:Class = Zuma2Images_IMAGE_DOT_WHITE_RGB;
       
      
      private var mImages:Dictionary;
      
      public function Zuma2Images()
      {
         super();
         this.mImages = new Dictionary();
         this.init();
      }
      
      private function init() : void
      {
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_UP_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_MOREGAMES_OVER_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_BUTTON_REDX_DOWN] = new ImageDescriptor(IMAGE_UPSELL_BUTTON_REDX_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_BUTTON_REDX_UP] = new ImageDescriptor(IMAGE_UPSELL_BUTTON_REDX_UP_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_BUTTON_PURPLEX_UP] = new ImageDescriptor(IMAGE_UPSELL_BUTTON_PURPLEX_UP_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_BUTTON_PURPLEX_DOWN] = new ImageDescriptor(IMAGE_UPSELL_BUTTON_PURPLEX_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_BUTTON_GETIT_UP] = new ImageDescriptor(IMAGE_UPSELL_BUTTON_GETIT_UP_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_BUTTON_GETIT_DOWN] = new ImageDescriptor(IMAGE_UPSELL_BUTTON_GETIT_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_HEROIC] = new ImageDescriptor(IMAGE_UPSELL_HEROIC_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_CHALLENGE] = new ImageDescriptor(IMAGE_UPSELL_CHALLENGE_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_FULL] = new ImageDescriptor(IMAGE_UPSELL_FULL_RGB,null,1,1);
         this.mImages[IMAGE_UPSELL_ADVENTURE] = new ImageDescriptor(IMAGE_UPSELL_ADVENTURE_RGB,null,1,1);
         this.mImages[IMAGE_HIGHSCORES_BUTTON_MENU_DOWN] = new ImageDescriptor(IMAGE_HIGHSCORES_BUTTON_MENU_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_HIGHSCORES_BUTTON_MENU_UP] = new ImageDescriptor(IMAGE_HIGHSCORES_BUTTON_MENU_UP_RGB,null,1,1);
         this.mImages[IMAGE_HIGHSCORES_BUTTON_MENU_OVER] = new ImageDescriptor(IMAGE_HIGHSCORES_BUTTON_MENU_OVER_RGB,null,1,1);
         this.mImages[IMAGE_HIGHSCORES_BACKGROUND] = new ImageDescriptor(IMAGE_HIGHSCORES_BACKGROUND_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_PAGE3_UP] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_PAGE3_UP_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_PAGE3_OVER_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_PAGE2_UP] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_PAGE2_UP_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_PAGE2_OVER_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_PAGE1_UP] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_PAGE1_UP_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_PAGE1_OVER_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BACKGROUND2] = new ImageDescriptor(IMAGE_HELPSCREEN_BACKGROUND2_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BACKGROUND3] = new ImageDescriptor(IMAGE_HELPSCREEN_BACKGROUND3_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_ACCURACY_BLUE] = new ImageDescriptor(IMAGE_BLOOM_ACCURACY_BLUE_RGB,IMAGE_BLOOM_ACCURACY_BLUE_ALPHA,1,1);
         this.mImages[IMAGE_BLOOM_ACCURACY_GREEN] = new ImageDescriptor(IMAGE_BLOOM_ACCURACY_GREEN_RGB,IMAGE_BLOOM_ACCURACY_GREEN_ALPHA,1,1);
         this.mImages[IMAGE_BLOOM_ACCURACY_PURPLE] = new ImageDescriptor(IMAGE_BLOOM_ACCURACY_PURPLE_RGB,IMAGE_BLOOM_ACCURACY_PURPLE_ALPHA,1,1);
         this.mImages[IMAGE_BLOOM_ACCURACY_RED] = new ImageDescriptor(IMAGE_BLOOM_ACCURACY_RED_RGB,IMAGE_BLOOM_ACCURACY_RED_ALPHA,1,1);
         this.mImages[IMAGE_BLOOM_ACCURACY_WHITE] = new ImageDescriptor(IMAGE_BLOOM_ACCURACY_WHITE_RGB,IMAGE_BLOOM_ACCURACY_WHITE_ALPHA,1,1);
         this.mImages[IMAGE_BLOOM_ACCURACY_YELLOW] = new ImageDescriptor(IMAGE_BLOOM_ACCURACY_YELLOW_RGB,IMAGE_BLOOM_ACCURACY_YELLOW_ALPHA,1,1);
         this.mImages[IMAGE_FROG_CANNON_CHEVRONS] = new ImageDescriptor(IMAGE_FROG_CANNON_CHEVRONS_RGB,null,1,1);
         this.mImages[IMAGE_UI_LIVES_FRAME] = new ImageDescriptor(IMAGE_UI_LIVES_FRAME_RGB,null,1,1);
         this.mImages[IMAGE_UI_LIVES_FROG] = new ImageDescriptor(IMAGE_UI_LIVES_FROG_RGB,null,1,1);
         this.mImages[IMAGE_UI_LEVELS_FRAME] = new ImageDescriptor(IMAGE_UI_LEVELS_FRAME_RGB,null,1,1);
         this.mImages[IMAGE_STAT_SCREEN_SPLAT] = new ImageDescriptor(IMAGE_STAT_SCREEN_SPLAT_RGB,IMAGE_STAT_SCREEN_SPLAT_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND] = new ImageDescriptor(IMAGE_OPTIONSMENU_TOGGLE_BACKGROUND_RGB,null,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_DOWN] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_UP] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_UP_RGB,null,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_OVER] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_OVER_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_OVER_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_HIGHSCORES_UP_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_OVER_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_HEROICFROG_UP_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_OVER_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_ADVENTURE_UP_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_OVER_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_TEXT_CHALLENGE_UP_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_BACKGROUND_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_BACKGROUND_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_BACKGROUND_UP_RGB,null,1,1);
         this.mImages[IMAGE_DEATHSKULL_LARGE_TOP] = new ImageDescriptor(IMAGE_DEATHSKULL_LARGE_TOP_RGB,IMAGE_DEATHSKULL_LARGE_TOP_ALPHA,1,1);
         this.mImages[IMAGE_DEATHSKULL_LARGE_MIDDLE] = new ImageDescriptor(IMAGE_DEATHSKULL_LARGE_MIDDLE_RGB,IMAGE_DEATHSKULL_LARGE_MIDDLE_ALPHA,1,1);
         this.mImages[IMAGE_DEATHSKULL_LARGE_BOTTOM] = new ImageDescriptor(IMAGE_DEATHSKULL_LARGE_BOTTOM_RGB,IMAGE_DEATHSKULL_LARGE_BOTTOM_ALPHA,1,1);
         this.mImages[IMAGE_DEATHSKULL_LARGE_BLACK] = new ImageDescriptor(IMAGE_DEATHSKULL_LARGE_BLACK_RGB,IMAGE_DEATHSKULL_LARGE_BLACK_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER_RGB,IMAGE_BACKGROUND_LEVEL5_LILYPAD_OVER_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP_RGB,IMAGE_BACKGROUND_LEVEL5_LILYPAD_UP_ALPHA,1,1);
         this.mImages[IMAGE_TRANSITION_BAMBOO_BOTTOM] = new ImageDescriptor(IMAGE_TRANSITION_BAMBOO_BOTTOM_RGB,IMAGE_TRANSITION_BAMBOO_BOTTOM_ALPHA,1,1);
         this.mImages[IMAGE_TRANSITION_BAMBOO_TOP] = new ImageDescriptor(IMAGE_TRANSITION_BAMBOO_TOP_RGB,IMAGE_TRANSITION_BAMBOO_TOP_ALPHA,1,1);
         this.mImages[IMAGE_PATH_EXPLOSION] = new ImageDescriptor(IMAGE_PATH_EXPLOSION_RGB,IMAGE_PATH_EXPLOSION_ALPHA,3,5);
         this.mImages[IMAGE_CANNON_BLAST] = new ImageDescriptor(IMAGE_CANNON_BLAST_RGB,IMAGE_CANNON_BLAST_ALPHA,3,5);
         this.mImages[IMAGE_BALL_CANNON] = new ImageDescriptor(IMAGE_BALL_CANNON_RGB,IMAGE_BALL_CANNON_ALPHA,1,1);
         this.mImages[IMAGE_FROG_CANNON_TOP] = new ImageDescriptor(IMAGE_FROG_CANNON_TOP_RGB,null,1,1);
         this.mImages[IMAGE_FROG_CANNON_EYES] = new ImageDescriptor(IMAGE_FROG_CANNON_EYES_RGB,IMAGE_FROG_CANNON_EYES_ALPHA,2,1);
         this.mImages[IMAGE_FROG_CANNON_BOTTOM] = new ImageDescriptor(IMAGE_FROG_CANNON_BOTTOM_RGB,null,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL1] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL1_RGB,null,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL1_TUNNEL1] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL1_TUNNEL1_RGB,IMAGE_BACKGROUND_LEVEL1_TUNNEL1_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL2] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL2_RGB,null,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL2_TUNNEL1] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL2_TUNNEL1_RGB,IMAGE_BACKGROUND_LEVEL2_TUNNEL1_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL2_TUNNEL2] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL2_TUNNEL2_RGB,IMAGE_BACKGROUND_LEVEL2_TUNNEL2_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL3] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL3_RGB,null,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL3_TUNNEL1] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL3_TUNNEL1_RGB,IMAGE_BACKGROUND_LEVEL3_TUNNEL1_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL3_TUNNEL2] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL3_TUNNEL2_RGB,IMAGE_BACKGROUND_LEVEL3_TUNNEL2_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL4] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL4_RGB,null,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL4_TUNNEL1] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL4_TUNNEL1_RGB,IMAGE_BACKGROUND_LEVEL4_TUNNEL1_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL4_TUNNEL2] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL4_TUNNEL2_RGB,IMAGE_BACKGROUND_LEVEL4_TUNNEL2_ALPHA,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL5] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL5_RGB,null,1,1);
         this.mImages[IMAGE_BACKGROUND_LEVEL5_TUNNEL1] = new ImageDescriptor(IMAGE_BACKGROUND_LEVEL5_TUNNEL1_RGB,IMAGE_BACKGROUND_LEVEL5_TUNNEL1_ALPHA,1,1);
         this.mImages[IMAGE_BALL_RING] = new ImageDescriptor(IMAGE_BALL_RING_RGB,null,1,1);
         this.mImages[IMAGE_DEATHSKULL_FIRERING] = new ImageDescriptor(IMAGE_DEATHSKULL_FIRERING_RGB,null,6,6);
         this.mImages[IMAGE_MAINMENU_BUTTON_SOUND_OFF_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_SOUND_OFF_DOWN_RGB,IMAGE_MAINMENU_BUTTON_DOWN_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_SOUND_OFF_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_SOUND_OFF_OVER_RGB,IMAGE_MAINMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_SOUND_OFF_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_SOUND_OFF_UP_RGB,IMAGE_MAINMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_SOUND_ON_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_SOUND_ON_DOWN_RGB,IMAGE_MAINMENU_BUTTON_DOWN_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_SOUND_ON_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_SOUND_ON_OVER_RGB,IMAGE_MAINMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_SOUND_ON_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_SOUND_ON_UP_RGB,IMAGE_MAINMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_OVER_RGB,IMAGE_OPTIONSMENU_BUTTON_SOUND_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_SOUND_UNCHECKED_RGB,IMAGE_OPTIONSMENU_BUTTON_SOUND_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_OVER_RGB,IMAGE_OPTIONSMENU_BUTTON_SOUND_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_SOUND_CHECKED_RGB,IMAGE_OPTIONSMENU_BUTTON_SOUND_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BACKGROUND] = new ImageDescriptor(IMAGE_MAINMENU_BACKGROUND_RGB,null,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_HELP_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_HELP_DOWN_RGB,IMAGE_MAINMENU_BUTTON_DOWN_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_HELP_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_HELP_UP_RGB,IMAGE_MAINMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_HELP_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_HELP_OVER_RGB,IMAGE_MAINMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_PLAY_DOWN] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_PLAY_DOWN_RGB,IMAGE_MAINMENU_BUTTON_DOWN_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_PLAY_UP] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_PLAY_UP_RGB,IMAGE_MAINMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_MAINMENU_BUTTON_PLAY_OVER] = new ImageDescriptor(IMAGE_MAINMENU_BUTTON_PLAY_OVER_RGB,IMAGE_MAINMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_DONTSHOW_DOWN] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_DONTSHOW_DOWN_RGB,IMAGE_HELPSCREEN_BUTTON_DONTSHOW_ALPHA,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_DONTSHOW_UP] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_DONTSHOW_UP_RGB,IMAGE_HELPSCREEN_BUTTON_DONTSHOW_ALPHA,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_DONTSHOW_OVER] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_DONTSHOW_OVER_RGB,IMAGE_HELPSCREEN_BUTTON_DONTSHOW_ALPHA,1,1);
         this.mImages[IMAGE_HELPSCREEN_BACKGROUND] = new ImageDescriptor(IMAGE_HELPSCREEN_BACKGROUND_RGB,null,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_CONTINUE_DOWN] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_CONTINUE_DOWN_RGB,IMAGE_HELPSCREEN_BUTTON_CONTINUE_ALPHA,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_CONTINUE_OVER] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_CONTINUE_OVER_RGB,IMAGE_HELPSCREEN_BUTTON_CONTINUE_ALPHA,1,1);
         this.mImages[IMAGE_HELPSCREEN_BUTTON_CONTINUE_UP] = new ImageDescriptor(IMAGE_HELPSCREEN_BUTTON_CONTINUE_UP_RGB,IMAGE_HELPSCREEN_BUTTON_CONTINUE_ALPHA,1,1);
         this.mImages[IMAGE_DIALOG_BUTTON_NO_DOWN] = new ImageDescriptor(IMAGE_DIALOG_BUTTON_NO_DOWN_RGB,IMAGE_HELPSCREEN_BUTTON_CONTINUE_ALPHA,1,1);
         this.mImages[IMAGE_DIALOG_BUTTON_NO_OVER] = new ImageDescriptor(IMAGE_DIALOG_BUTTON_NO_OVER_RGB,IMAGE_DIALOG_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_DIALOG_BUTTON_NO_UP] = new ImageDescriptor(IMAGE_DIALOG_BUTTON_NO_UP_RGB,IMAGE_DIALOG_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_DIALOG_BUTTON_YES_DOWN] = new ImageDescriptor(IMAGE_DIALOG_BUTTON_YES_DOWN_RGB,IMAGE_DIALOG_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_DIALOG_BUTTON_YES_OVER] = new ImageDescriptor(IMAGE_DIALOG_BUTTON_YES_OVER_RGB,IMAGE_DIALOG_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_DIALOG_BUTTON_YES_UP] = new ImageDescriptor(IMAGE_DIALOG_BUTTON_YES_UP_RGB,IMAGE_DIALOG_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_DIALOG_BACKGROUND] = new ImageDescriptor(IMAGE_DIALOG_BACKGROUND_RGB,IMAGE_DIALOG_BACKGROUND_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BACKGROUND] = new ImageDescriptor(IMAGE_OPTIONSMENU_BACKGROUND_RGB,IMAGE_OPTIONSMENU_BACKGROUND_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_BACK_DOWN] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_BACK_DOWN_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_BACK_OVER] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_BACK_OVER_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_BACK_UP] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_BACK_UP_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_HELP_DOWN] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_HELP_DOWN_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_HELP_OVER] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_HELP_OVER_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_HELP_UP] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_HELP_UP_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_RESTART_DOWN] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_RESTART_DOWN_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_RESTART_OVER] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_RESTART_OVER_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_OPTIONSMENU_BUTTON_RESTART_UP] = new ImageDescriptor(IMAGE_OPTIONSMENU_BUTTON_RESTART_UP_RGB,IMAGE_OPTIONSMENU_BUTTON_ALPHA,1,1);
         this.mImages[IMAGE_INGAME_MENUBUTTON_UP] = new ImageDescriptor(IMAGE_INGAME_MENUBUTTON_UP_RGB,null,1,1);
         this.mImages[IMAGE_INGAME_MENUBUTTON_DOWN] = new ImageDescriptor(IMAGE_INGAME_MENUBUTTON_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_INGAME_MENUBUTTON_OVER] = new ImageDescriptor(IMAGE_INGAME_MENUBUTTON_OVER_RGB,null,1,1);
         this.mImages[IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP] = new ImageDescriptor(IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_UP_RGB,null,1,1);
         this.mImages[IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN] = new ImageDescriptor(IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER] = new ImageDescriptor(IMAGE_STAT_SCREEN_PLAYAGAIN_BUTTON_OVER_RGB,null,1,1);
         this.mImages[IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP] = new ImageDescriptor(IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP_RGB,IMAGE_STAT_SCREEN_UPSELL_BUTTON_UP_ALPHA,1,1);
         this.mImages[IMAGE_STAT_SCREEN_BACKGROUND] = new ImageDescriptor(IMAGE_STAT_SCREEN_BACKGROUND_RGB,null,1,1);
         this.mImages[IMAGE_FRUIT_GLOW] = new ImageDescriptor(IMAGE_FRUIT_GLOW_RGB,IMAGE_FRUIT_GLOW_ALPHA,1,1);
         this.mImages[IMAGE_FRUIT_ACORN] = new ImageDescriptor(IMAGE_FRUIT_ACORN_RGB,IMAGE_FRUIT_ACORN_ALPHA,6,10);
         this.mImages[IMAGE_FRUIT_ACORN_GLOW] = new ImageDescriptor(IMAGE_FRUIT_ACORN_GLOW_RGB,IMAGE_FRUIT_ACORN_GLOW_ALPHA,6,10);
         this.mImages[IMAGE_FROG_EYES] = new ImageDescriptor(IMAGE_FROG_EYES_RGB,null,2,1);
         this.mImages[IMAGE_UI_BAR] = new ImageDescriptor(IMAGE_UI_BAR_RGB,IMAGE_UI_BAR_ALPHA,1,1);
         this.mImages[IMAGE_UI_MENUBUTTON_DOWN] = new ImageDescriptor(IMAGE_UI_MENUBUTTON_DOWN_RGB,null,1,1);
         this.mImages[IMAGE_UI_MENUBUTTON_UP] = new ImageDescriptor(IMAGE_UI_MENUBUTTON_UP_RGB,null,1,1);
         this.mImages[IMAGE_UI_MENUBUTTON_OVER] = new ImageDescriptor(IMAGE_UI_MENUBUTTON_OVER_RGB,null,1,1);
         this.mImages[IMAGE_UI_SCOREBAR] = new ImageDescriptor(IMAGE_UI_SCOREBAR_RGB,null,1,1);
         this.mImages[IMAGE_UI_SCORENUMBERS] = new ImageDescriptor(IMAGE_UI_SCORENUMBERS_RGB,null,11,1);
         this.mImages[IMAGE_UI_TIMERBAR_EMPTY] = new ImageDescriptor(IMAGE_UI_TIMERBAR_EMPTY_RGB,null,1,1);
         this.mImages[IMAGE_UI_TIMERBAR_FULL] = new ImageDescriptor(IMAGE_UI_TIMERBAR_FULL_RGB,null,1,1);
         this.mImages[IMAGE_FROG_TONGUE] = new ImageDescriptor(IMAGE_FROG_TONGUE_RGB,null,1,1);
         this.mImages[IMAGE_STOP_OUTLINE] = new ImageDescriptor(IMAGE_STOP_OUTLINE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_REVERSE_BLUE] = new ImageDescriptor(IMAGE_BLOOM_REVERSE_BLUE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_REVERSE_RED] = new ImageDescriptor(IMAGE_BLOOM_REVERSE_RED_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_REVERSE_GREEN] = new ImageDescriptor(IMAGE_BLOOM_REVERSE_GREEN_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_REVERSE_YELLOW] = new ImageDescriptor(IMAGE_BLOOM_REVERSE_YELLOW_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_REVERSE_PURPLE] = new ImageDescriptor(IMAGE_BLOOM_REVERSE_PURPLE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_REVERSE_WHITE] = new ImageDescriptor(IMAGE_BLOOM_REVERSE_WHITE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_STOP_BLUE] = new ImageDescriptor(IMAGE_BLOOM_STOP_BLUE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_STOP_RED] = new ImageDescriptor(IMAGE_BLOOM_STOP_RED_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_STOP_GREEN] = new ImageDescriptor(IMAGE_BLOOM_STOP_GREEN_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_STOP_YELLOW] = new ImageDescriptor(IMAGE_BLOOM_STOP_YELLOW_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_STOP_PURPLE] = new ImageDescriptor(IMAGE_BLOOM_STOP_PURPLE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_STOP_WHITE] = new ImageDescriptor(IMAGE_BLOOM_STOP_WHITE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_BLAST_BLUE] = new ImageDescriptor(IMAGE_BLOOM_BLAST_BLUE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_BLAST_RED] = new ImageDescriptor(IMAGE_BLOOM_BLAST_RED_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_BLAST_GREEN] = new ImageDescriptor(IMAGE_BLOOM_BLAST_GREEN_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_BLAST_YELLOW] = new ImageDescriptor(IMAGE_BLOOM_BLAST_YELLOW_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_BLAST_PURPLE] = new ImageDescriptor(IMAGE_BLOOM_BLAST_PURPLE_RGB,null,1,1);
         this.mImages[IMAGE_BLOOM_BLAST_WHITE] = new ImageDescriptor(IMAGE_BLOOM_BLAST_WHITE_RGB,null,1,1);
         this.mImages[IMAGE_BALL_GLOW] = new ImageDescriptor(IMAGE_BALL_GLOW_RGB,null,1,1);
         this.mImages[IMAGE_PATH_SPARKLES] = new ImageDescriptor(IMAGE_PATH_SPARKLES_RGB,null,1,14);
         this.mImages[IMAGE_EXPLOSION_BOMB] = new ImageDescriptor(IMAGE_BOMB_EXPLOSION_RGB,null,3,10);
         this.mImages[IMAGE_POWERUP_REVERSE_PULSE] = new ImageDescriptor(IMAGE_POWERUP_REVERSE_PULSE_RGB,IMAGE_POWERUP_REVERSE_PULSE_ALPHA,1,22);
         this.mImages[IMAGE_POWERUP_BLUE] = new ImageDescriptor(IMAGE_POWERUP_BLUE_RGB,IMAGE_POWERUP_ALPHA,1,7);
         this.mImages[IMAGE_POWERUP_RED] = new ImageDescriptor(IMAGE_POWERUP_RED_RGB,IMAGE_POWERUP_ALPHA,1,7);
         this.mImages[IMAGE_POWERUP_GREEN] = new ImageDescriptor(IMAGE_POWERUP_GREEN_RGB,IMAGE_POWERUP_ALPHA,1,7);
         this.mImages[IMAGE_POWERUP_YELLOW] = new ImageDescriptor(IMAGE_POWERUP_YELLOW_RGB,IMAGE_POWERUP_ALPHA,1,7);
         this.mImages[IMAGE_POWERUP_PURPLE] = new ImageDescriptor(IMAGE_POWERUP_PURPLE_RGB,IMAGE_POWERUP_ALPHA,1,7);
         this.mImages[IMAGE_POWERUP_WHITE] = new ImageDescriptor(IMAGE_POWERUP_WHITE_RGB,IMAGE_POWERUP_ALPHA,1,7);
         this.mImages[IMAGE_POWERUP_POWERPULSES] = new ImageDescriptor(IMAGE_POWERUP_POWERPULSES_RGB,null,1,7);
         this.mImages[IMAGE_FROG_TOP] = new ImageDescriptor(IMAGE_FROG_TOP_RGB,null,1,1);
         this.mImages[IMAGE_FROG_BOTTOM] = new ImageDescriptor(IMAGE_FROG_BOTTOM_RGB,null,1,1);
         this.mImages[IMAGE_DOT_BLUE] = new ImageDescriptor(IMAGE_DOT_BLUE_RGB,null,1,1);
         this.mImages[IMAGE_DOT_RED] = new ImageDescriptor(IMAGE_DOT_RED_RGB,null,1,1);
         this.mImages[IMAGE_DOT_GREEN] = new ImageDescriptor(IMAGE_DOT_GREEN_RGB,null,1,1);
         this.mImages[IMAGE_DOT_YELLOW] = new ImageDescriptor(IMAGE_DOT_YELLOW_RGB,null,1,1);
         this.mImages[IMAGE_DOT_PURPLE] = new ImageDescriptor(IMAGE_DOT_PURPLE_RGB,null,1,1);
         this.mImages[IMAGE_DOT_WHITE] = new ImageDescriptor(IMAGE_DOT_WHITE_RGB,null,1,1);
         this.mImages[IMAGE_DOT_BLACK] = new ImageDescriptor(IMAGE_DOT_BLACK_RGB,null,1,1);
         this.mImages[IMAGE_BALL_BLUE] = new ImageDescriptor(IMAGE_BALL_BLUE_RGB,null,6,10);
         this.mImages[IMAGE_BALL_RED] = new ImageDescriptor(IMAGE_BALL_RED_RGB,null,6,10);
         this.mImages[IMAGE_BALL_GREEN] = new ImageDescriptor(IMAGE_BALL_GREEN_RGB,null,6,10);
         this.mImages[IMAGE_BALL_YELLOW] = new ImageDescriptor(IMAGE_BALL_YELLOW_RGB,null,6,10);
         this.mImages[IMAGE_BALL_PURPLE] = new ImageDescriptor(IMAGE_BALL_PURPLE_RGB,null,6,10);
         this.mImages[IMAGE_BALL_WHITE] = new ImageDescriptor(IMAGE_BALL_WHITE_RGB,null,6,10);
         this.mImages[IMAGE_BALL_BLUE_EXPLOSION] = new ImageDescriptor(IMAGE_BALL_BLUE_EXPLOSION_RGB,IMAGE_BALL_BLUE_EXPLOSION_ALPHA,1,11);
         this.mImages[IMAGE_BALL_RED_EXPLOSION] = new ImageDescriptor(IMAGE_BALL_RED_EXPLOSION_RGB,IMAGE_BALL_RED_EXPLOSION_ALPHA,1,11);
         this.mImages[IMAGE_BALL_GREEN_EXPLOSION] = new ImageDescriptor(IMAGE_BALL_GREEN_EXPLOSION_RGB,IMAGE_BALL_GREEN_EXPLOSION_ALPHA,1,11);
         this.mImages[IMAGE_BALL_PURPLE_EXPLOSION] = new ImageDescriptor(IMAGE_BALL_PURPLE_EXPLOSION_RGB,IMAGE_BALL_PURPLE_EXPLOSION_ALPHA,1,11);
         this.mImages[IMAGE_BALL_YELLOW_EXPLOSION] = new ImageDescriptor(IMAGE_BALL_YELLOW_EXPLOSION_RGB,IMAGE_BALL_YELLOW_EXPLOSION_ALPHA,1,11);
         this.mImages[IMAGE_BALL_WHITE_EXPLOSION] = new ImageDescriptor(IMAGE_BALL_WHITE_EXPLOSION_RGB,IMAGE_BALL_WHITE_EXPLOSION_ALPHA,1,11);
         this.mImages[IMAGE_LEVELBACKGROUND_VOLCANO1] = new ImageDescriptor(IMAGE_LEVELBACKGROUND_VOLCANO1_RGB,null,1,1);
         this.mImages[IMAGE_LEVELBACKGROUND_VOLCANO1_CHUTE1] = new ImageDescriptor(IMAGE_LEVELBACKGROUND_VOLCANO1_CHUTE1_RGB,IMAGE_LEVELBACKGROUND_VOLCANO1_CHUTE1_ALPHA,1,1);
         this.mImages[IMAGE_DEATHSKULL_JAW] = new ImageDescriptor(IMAGE_DEATHSKULL_JAW_RGB,IMAGE_DEATHSKULL_JAW_ALPHA,1,1);
         this.mImages[IMAGE_DEATHSKULL_HEAD] = new ImageDescriptor(IMAGE_DEATHSKULL_HEAD_RGB,IMAGE_DEATHSKULL_HEAD_ALPHA,1,1);
         this.mImages[IMAGE_DEATHSKULL_BASE] = new ImageDescriptor(IMAGE_DEATHSKULL_BASE_RGB,IMAGE_DEATHSKULL_BASE_ALPHA,1,1);
         this.mImages[IMAGE_DEATHSKULL_HOLE] = new ImageDescriptor(IMAGE_DEATHSKULL_HOLE_RGB,IMAGE_DEATHSKULL_HOLE_ALPHA,1,1);
         this.mImages[IMAGE_SKULLPATH] = new ImageDescriptor(IMAGE_SKULLPATH_RGB,IMAGE_SKULLPATH_ALPHA,1,1);
         this.mImages[IMAGE_SKULLPATH_LIT] = new ImageDescriptor(IMAGE_SKULLPATH_LIT_RGB,IMAGE_SKULLPATH__LIT_ALPHA,1,1);
      }
      
      public function getImageInst(id:String) : ImageInst
      {
         var desc:ImageDescriptor = this.mImages[id];
         if(desc == null)
         {
            return null;
         }
         var res:ImageResource = desc.getResource();
         if(res == null)
         {
            return null;
         }
         var inst:ImageInst = new ImageInst();
         inst.mSource = res;
         return inst;
      }
      
      public function getBitmapData(id:String) : BitmapData
      {
         var desc:ImageDescriptor = this.mImages[id];
         if(desc == null)
         {
            return null;
         }
         var res:ImageResource = desc.getResource();
         if(res == null)
         {
            return null;
         }
         return res.mFrames[0];
      }
   }
}
