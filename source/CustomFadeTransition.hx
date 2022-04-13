package;

import flixel.math.FlxMath;
import Conductor.BPMChangeEvent;
import flixel.FlxG;
import flixel.addons.ui.FlxUIState;
import flixel.math.FlxRect;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxGradient;
import flixel.FlxSubState;
import flixel.FlxSprite;
import flixel.text.FlxText;


class CustomFadeTransition extends MusicBeatSubstate {
	public static var finishCallback:Void->Void;
	private var leTween:FlxTween = null;
	public function new(duration:Float, isTransIn:Bool) {
		super();

		var zoom:Float = CoolUtil.boundTo(FlxG.camera.zoom, 0.05, 1);
		var width:Int = Std.int(FlxG.width / zoom);
		var height:Int = Std.int(FlxG.height / zoom);
		var transGradient:FlxSprite = FlxGradient.createGradientFlxSprite(width, height, (isTransIn ? [0x0, FlxColor.BLACK] : [FlxColor.BLACK, 0x0]));
		transGradient.scrollFactor.set();
		add(transGradient);

		var transBlack:FlxSprite = new FlxSprite().makeGraphic(width, height + 400, FlxColor.BLACK);
		transBlack.scrollFactor.set();
		add(transBlack);

		var loadingScreen:FlxSprite = new FlxSprite().loadGraphic(Paths.image('dgd_loading_screen'));
		loadingScreen.setGraphicSize(Std.int(width * 1));
		loadingScreen.updateHitbox();
		loadingScreen.screenCenter();
		loadingScreen.scrollFactor.set();
		var loadingText:FlxText = new FlxText(10, height, 0, 'Loading...', 64);
		loadingText.setFormat(Paths.font("vcr.ttf"), 64, FlxColor.WHITE);
		loadingText.y -= loadingText.height;
		loadingText.scrollFactor.set();


		
		

		transGradient.x -= (width - FlxG.width) / 2;
		transBlack.x = transGradient.x;

		if(isTransIn) {
			transGradient.y = transBlack.y - transBlack.height;
			FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {onUpdate: function(twn:FlxTween) {
				transBlack.y = transGradient.y + transGradient.height;
				//loadingScreen.alpha = FlxMath.lerp(0, 1, twn.percent);
			}, onComplete: function(twn:FlxTween) {
				close();
			}, ease: FlxEase.linear});
		} else {
			transGradient.y = -transGradient.height;
			transBlack.y = transGradient.y - transBlack.height + 50;
			leTween = FlxTween.tween(transGradient, {y: transGradient.height + 50}, duration, {onUpdate: function(twn:FlxTween) {
				transBlack.y = transBlack.y = transGradient.y - transBlack.height + 50;
				if(transBlack.y > 0) transBlack.y = 0;
				//loadingScreen.alpha = FlxMath.lerp(1, 0, twn.percent);
			}, onComplete: function(twn:FlxTween) {
				remove(transGradient);
				remove(transBlack);
				add(loadingScreen);
				add(loadingText);
				finishCallback();
			}, ease: FlxEase.linear});
		}
	}

	override function destroy() {
		if(leTween != null) {
			finishCallback();
			leTween.cancel();
		}
		super.destroy();
	}
}