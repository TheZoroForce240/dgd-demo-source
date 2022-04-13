package;

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];

	private static var creditsStuff:Array<Dynamic> = [ //Name - Icon name - Description - Link - BG Color
		['Demigod Duel'],
		['jacoborwhatev1', 'jacob', 'Director', 'https://www.youtube.com/channel/UCInyrca4g5NvfejQnexfA2w', 0xFF580183],
		['Musicians'],
		['Spurk', 'Spurk', 'Musician', 'https://www.youtube.com/channel/UC9lmZjJ1gaGHUMg9rNtEb5w', 0xFF007619],
		['3psilonMusic', '3psilonMusic', 'Musician', 'https://gamebanana.com/members/2075555', 0xFFFFFFFF],
		['Totally-Not-Genji', 'engi', 'Musician', 'https://gamebanana.com/members/1936367', 0xFFCC0000],
		['Ves', 'ves', 'Musician', 'https://www.youtube.com/channel/UC9Qc-TN0P0d5O83yp-jqOBg', 0xFF260000],
		['RaymondVito', 'cheese', 'Musician', 'https://www.youtube.com/channel/UCHwsDF7EjR87eGkURvVogSg/featured', 0xFFD99100],
		['LordVoiid', 'Void', 'Musician', 'https://www.youtube.com/channel/UCvLIlgVpzb66SrvZXtRwhig', 0xFF580183],
		['GalaxyGodDamian', 'GalaxyGodDamian', 'Musician', 'https://www.youtube.com/channel/UCpuTIRf5p5hD18SsMuZos3A', 0xFF390E64],
		['Artists'],
		['Temoso', 'Temoso', 'Artist', 'https://twitter.com/BreakerboyYt', 0xFFFFFFFF],
		['Takei', 'Takei', 'Artist', 'https://twitter.com/takeitheartist', 0xFFAA00FF],
		['TheMineFormer', 'TheMineFormer', 'Artist', 'https://www.youtube.com/channel/UCigyKOgADtugeLiIwMzYPHQ', 0xFFC4B07A],
		['Oddestial', 'odd', 'Artist', 'https://twitter.com/oddestial', 0xFFA40000],
		['funkypoppp', 'Funkypop', 'Artist', 'https://www.youtube.com/channel/UCUlrNf2KZD7JJT6M_t9qeAA', 0xFF56473B],
		['xeoplex', 'complex', 'Artist', 'https://www.youtube.com/channel/UC5w2f5LMiU9AntEYQ18u7Eg', 0xFFFFF200],
		['MarquisArtuis', 'marquis', 'Artist', 'https://twitter.com/MarquisArtuis', 0xFF3F53C0],
		['shagLSSJ', 'shag', 'Artist', 'https://twitter.com/PaldoFranks', 0xFFAC1212],
		['YeetSkDeet', 'yeet', 'Artist', 'https://twitter.com/YeetSkDeet', 0xFF4EEAFF],
		['clo', 'clo', 'Artist', 'https://twitter.com/PHANTOMCLO', 0xFF990FF2],
		['VespilloSanctus', 'vespillo', 'Credit Icons', 'https://twitter.com/VespilloSanctus', 0xFF00FF00],
		['Charters'],
		['fancy_peashooter', 'fp', 'Charter', 'https://www.youtube.com/channel/UCKrcpr1Hd-KsfhX-GjmWIyQ', 0xFFC012FA],
		['Epic_Cole', 'Epic_Cole', 'Charter', 'https://gamebanana.com/members/2002768', 0xFF856F53],
		['jacoborwhatev1', 'jacob', 'Charter', 'https://www.youtube.com/channel/UCInyrca4g5NvfejQnexfA2w', 0xFF580183],
		['RaymondVito', 'cheese', 'Charter', 'https://www.youtube.com/channel/UCHwsDF7EjR87eGkURvVogSg/featured', 0xFFD99100],
		['3psilonMusic', '3psilonMusic', 'Charter', 'https://gamebanana.com/members/2075555', 0xFFFFFFFF],
		['Death1nsurance', 'death', 'Charter', 'https://www.youtube.com/channel/UCCeA-NiAcqtK7ET71qo_TQQ', 0xFFFF0000],
		['Programmers'],
		['heatsumi', 'heat', 'Programmer', 'https://gamebanana.com/members/1972449', 0xFFFFFFFF],
		['Stormdrifter', 'stormdrifter', 'Programmer', 'https://twitter.com/BlursedSV', 0xFF640000],
		['Fallnnn', 'fallnnn', 'Programmer', 'https://www.youtube.com/channel/UCeRS0NH0OMa_GM8-XH2Bymg', 0xFF2E2E2E],
		['TheZoroForce240', 'zoro', 'Programmer', 'https://www.youtube.com/channel/UCjXs9mcE531CrmaQrf0OkOw', 0xFF0056FF],
		['Special thanks'],
		['Luigi Spy', 'Luigi Spy', 'Spanish Translator', '', 0xFF4A1D1D],
		['Official_YS', 'Official_YS', 'Trailer', 'https://www.youtube.com/channel/UCbTTlmUUwpOCHML8yCilHUA', 0xFFFFFFFF],
		[''],
		['The Shaggy mod'],
		['srPerez', 'perez', 'Coder, Main artist & animator, Main composer, Co-charter', 'https://twitter.com/NewSrPerez', 0xFFFF9E00],
		['MORO', 'moro', 'Artist & animator of WB Shaggy sprites\n& Chapter 5 cutscene', 'https://twitter.com/Moro0986', 0xFF7027AD],
		['Saruky', 'saruky', 'Composer of "Thunderstorm"', 'https://twitter.com/Saruky__', 0xFFDA0837],
		['Joan Atlas', 'tono', 'Composer of "Dissasembler"', 'https://twitter.com/joan_atlas', 0xFF543BC9],
		['Special thanks'],
		['Soulegal', 'soulegal', 'Brazilian-Portuguese Co-Translator', 'https://twitter.com/nickstwt', 0xFFBF2322],
		['Aizakku', 'aizakku', 'Brazilian-Portuguese Co-Translator', 'https://twitter.com/ItsAizakku', 0xFFC7CDD6],
		['Cony', 'cony', 'Artist of the epic Shaggy close-up', 'https://www.instagram.com/con0mmm/', 0xFFEAE4B0],
		['Kade Dev', 'kade', 'Updated input system', 'https://twitter.com/KadeDeveloper', 0xFF4A6747],
		['Pointy', 'pointy', 'Playtester', 'https://twitter.com/PointyyESM', 0xFF28389D],
		['Sulayre', 'sulayre', 'Matt sprites (used in story menu)', 'https://twitter.com/Sulayre', 0xFF9F60CA],
		['McChomk', 'mcchomk', 'Transcribed the OG dialogue into\nthe new dialogue file system', 'https://mcchomk.itch.io', 0xFFBE672D],
		[''],
		['Psych Engine Team'],
		['Shadow Mario',		'shadowmario',		'Main Programmer of Psych Engine',					'https://twitter.com/Shadow_Mario_',	0xFFFFDD33],
		['RiverOaken',			'riveroaken',		'Main Artist/Animator of Psych Engine',				'https://twitter.com/river_oaken',		0xFFC30085],
		['Keoiki',				'keoiki',			'Note Splash Animations',							'https://twitter.com/Keoiki_',			0xFFFFFFFF],
		['PolybiusProxy',		'polybiusproxy',	'.MP4 Video Loader Extension',						'https://twitter.com/polybiusproxy',	0xFFE01F32],
		[''],
		["Funkin' Crew"],
		['ninjamuffin99',		'ninjamuffin99',	"Programmer of Friday Night Funkin'",				'https://twitter.com/ninja_muffin99',	0xFFF73838],
		['PhantomArcade',		'phantomarcade',	"Animator of Friday Night Funkin'",					'https://twitter.com/PhantomArcade3K',	0xFFFFBB1B],
		['evilsk8r',			'evilsk8r',			"Artist of Friday Night Funkin'",					'https://twitter.com/evilsk8r',			0xFF53E52C],
		['kawaisprite',			'kawaisprite',		"Composer of Friday Night Funkin'",					'https://twitter.com/kawaisprite',		0xFF6475F3]
	];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	public function new (startCredit:Int = 1)
	{
		curSelected = startCredit;
		super();
	}

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if(isSelectable) {
				optionText.x -= 70;
			}
			if (creditsStuff[i][1] == '')
				optionText.screenCenter(X);
			optionText.forceX = optionText.x;
			//optionText.yMult = 90;
			optionText.targetY = i;
			grpOptions.add(optionText);

			if(isSelectable) {
				var icon:AttachedSprite = new AttachedSprite('credits/' + creditsStuff[i][1]);
				icon.xAdd = optionText.width + 10;
				icon.sprTracker = optionText;
	
				// using a FlxGroup is too much fuss!
				iconArray.push(icon);
				add(icon);
			}
		}

		descText = new FlxText(50, 600, 1180, "", 32);
		descText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		descText.scrollFactor.set();
		descText.borderSize = 2.4;
		add(descText);

		bg.color = creditsStuff[curSelected][4];
		intendedColor = bg.color;
		changeSelection();
		super.create();
	}

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;

		if (upP)
		{
			changeSelection(-1);
		}
		if (downP)
		{
			changeSelection(1);
		}

		if (controls.BACK)
		{
			if(colorTween != null) {
				colorTween.cancel();
			}
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if(controls.ACCEPT) {
			CoolUtil.browserLoad(creditsStuff[curSelected][3]);
		}
		super.update(elapsed);
	}

	function changeSelection(change:Int = 0)
	{
		FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
		do {
			curSelected += change;
			if (curSelected < 0)
				curSelected = creditsStuff.length - 1;
			if (curSelected >= creditsStuff.length)
				curSelected = 0;
		} while(unselectableCheck(curSelected));

		var newColor:Int = creditsStuff[curSelected][4];
		if(newColor != intendedColor) {
			if(colorTween != null) {
				colorTween.cancel();
			}
			intendedColor = newColor;
			colorTween = FlxTween.color(bg, 1, bg.color, intendedColor, {
				onComplete: function(twn:FlxTween) {
					colorTween = null;
				}
			});
		}

		var bullShit:Int = 0;

		for (item in grpOptions.members)
		{
			item.targetY = bullShit - curSelected;
			bullShit++;

			if(!unselectableCheck(bullShit-1)) {
				item.alpha = 0.6;
				if (item.targetY == 0) {
					item.alpha = 1;
				}
			}
		}
		descText.text = creditsStuff[curSelected][2];
	}

	private function unselectableCheck(num:Int):Bool {
		return creditsStuff[num].length <= 1;
	}
}
