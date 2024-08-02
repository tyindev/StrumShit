package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.system.System;
import options.Controls;
import options.Options;
import flixel.ui.FlxButton;

class MainMenuState extends SwagState {
	override public function create() {
		FlxG.mouse.visible = true;
		FlxG.stage.window.title = "Moon4K - MainMenuState";
		#if desktop
		Discord.changePresence("In the Main Menu!", null);
		#end

		var swagbg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('mainmenu/bg'));
		swagbg.setGraphicSize(Std.int(swagbg.width * 1.1));
		swagbg.updateHitbox();
		swagbg.screenCenter();
		swagbg.visible = true;
		swagbg.antialiasing = true;
		add(swagbg);

		var buttonGraphic:FlxSprite = new FlxSprite().loadGraphic("assets/images/mainmenu/button.png");

		var singlePlayerButton:FlxButton = new FlxButton(0, 0, "", function() {
			transitionState(new states.Freeplay());
		});
		singlePlayerButton.loadGraphic(buttonGraphic.graphic, false, 80, 20);
		singlePlayerButton.label.setFormat(Paths.font('vcr.ttf'), 14, FlxColor.PURPLE, "center", FlxColor.PURPLE);
		singlePlayerButton.label.text = "Solo";
		singlePlayerButton.x = (FlxG.width / 2) - singlePlayerButton.width - 120;
		singlePlayerButton.y = FlxG.height / 1.3 - singlePlayerButton.height / 1.3;
		add(singlePlayerButton);

		/*
		var downloadSongsButton:FlxButton = new FlxButton(0, 0, "", function() {
			transitionState(new states.OnlineDLState());
		});
		downloadSongsButton.loadGraphic(buttonGraphic.graphic, false, 80, 20);
		downloadSongsButton.label.setFormat(Paths.font('vcr.ttf'), 14, FlxColor.PURPLE, "center", FlxColor.PURPLE);
		downloadSongsButton.label.text = "Download Songs";
		downloadSongsButton.x = (FlxG.width / 2) - downloadSongsButton.width / 2;
		downloadSongsButton.y = FlxG.height / 1.3 - downloadSongsButton.height / 1.3;
		add(downloadSongsButton);
		*/

		var optionsButton:FlxButton = new FlxButton(0, 0, "", function() {
			transitionState(new states.OptionSelectState());
		});
		optionsButton.loadGraphic(buttonGraphic.graphic, false, 80, 20);
		optionsButton.label.setFormat(Paths.font('vcr.ttf'), 14, FlxColor.PURPLE, "center", FlxColor.PURPLE);
		optionsButton.label.text = "Settings";
		optionsButton.x = (FlxG.width / 2) + 115; 
		optionsButton.y = FlxG.height / 1.3 - optionsButton.height / 1.3;
		add(optionsButton);

		var versionShit:FlxText = new FlxText(5, FlxG.height - 18, 0, "Moon4K" + Utils.VERSION, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// taken from indie cross lol 
		#if desktop
		if (GameJoltAPI.getStatus())
		{
			Main.gjToastManager.createToast(null, 'Signed in as ' + GameJoltAPI.getUserInfo(), 'Connected to GameJolt', false);
		}
		#end

		super.create();
	}

	override public function update(elapsed:Float) {

		if (FlxG.keys.justPressed.SEVEN)
		{
			//transitionState(new states.OnlineDLState());
		}
		super.update(elapsed);
	}
}
