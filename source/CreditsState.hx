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
import sys.FileSystem;
import lime.utils.Assets;

using StringTools;

class CreditsState extends MusicBeatState
{
	var curSelected:Int = 1;

	private var grpOptions:FlxTypedGroup<Alphabet>;
	private var iconArray:Array<AttachedSprite> = [];
	private var creditsStuff:Array<Dynamic> = [];

	var bg:FlxSprite;
	var descText:FlxText;
	var intendedColor:Int;
	var colorTween:FlxTween;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("Nos Menus", null);
		#end

		bg = new FlxSprite().loadGraphic(Paths.image('menuDesat'));
		add(bg);

		grpOptions = new FlxTypedGroup<Alphabet>();
		add(grpOptions);

		#if MODS_ALLOWED
		trace("finding mod shit");
		if (FileSystem.exists(Paths.mods())) {
			trace("mods folder");
			if (FileSystem.exists(Paths.modFolders("data/credits.txt"))){
				trace("credit file");
				var firstarray:Array<String> = CoolUtil.coolTextFile(Paths.modFolders("data/credits.txt"));
				trace("found credit shit");
				
				for(i in firstarray){
					var arr:Array<String> = i.split("::");
					trace(arr);
					creditsStuff.push(arr);
				}
			}
		}
		
		#end
		var pisspoop = [ //Name - Icon name - Description - Link - BG Color
		[
			'Arwen Team'
		],
		[
			'Hiro Mizuki',
			'hiromizuki',
			'Programador, Tradutor e Portador',
			'https://www.youtube.com/channel/UCocLUzcPyeHkI6QG3A78F-w',
			'0xFF38e06b'
		],
        	[
			'SenshiZ',
			'senshi_z',
			'Charter Principal',
			'https://twitter.com/Senshi_Z12',
			'0xFF37fa19'
		],
		[
			'Nashira',
			'nashira',
			'Animadora e Artista',
			'https://twitter.com/abo_bora',
			'0xFF7a2ce8'
		],
		[
			'BeastlyChip',
			'beastlychip',
			'Compositor, Charter, Programador e Tradutor',
			'https://twitter.com/BeastlyChip',
			'0xFFd13bca'
		],		
		[
			'Suok',
			'suok',
			'Artista',
			'https://twitter.com/oSuOk3',
			'0xFFd41c53'
		],
		[
			'BeastlyMaxx',
			'maxx',
			'Compositora',
			'https://twitter.com/euEkokichi',
			'0xFFe66300'
		],
		[
			'NaferNightmare',
			'nafernightmare',
			'Animador e Artista',
			'https://twitter.com/NaferNightmare',
			'0xFFeda12f'
		],
		[
			'NxtVithor',
			'nxtvithor',
			'Apoio nas Charts',
			'https://twitter.com/NxtVithor',
			'0xFFf5de11'
		],
		[
			'Roaded64',
			'roaded64',
			'Primeiro Programador Principal (V1)',
			'https://twitter.com/RoadedOfficial',
			'0xFF151d3b'
		],
		[
			'Lone',
			'lone',
			'Artista, Animador e Programador (V1)',
			'https://twitter.com/Lonius_',
			'0xFFde1212'
		],
		[
			''
		],
		[
			'Time da Psych Engine'
		],
		[
			'Shadow Mario',
			'shadowmario',
			'Programador Principal da Psych Engine',
			'https://twitter.com/Shadow_Mario_',
			'0xFFFFDD33'
		],
		[
			'RiverOaken',
			'riveroaken',
			'Artista/Animador Principal da Psych Engine',
			'https://twitter.com/river_oaken',
			'0xFFC30085'
		],
		[
			''
		],
		[
			'Contribuidores da Engine'
		],
		[
			'shubs',
			'shubs',
			'Programador do Novo Input',
			'https://twitter.com/yoshubs',
			'0xFF4494E6'
		],
		[
			'PolybiusProxy',
			'polybiusproxy',
			'Extensão de Carregar Vídeos .MP4',
			'https://twitter.com/polybiusproxy',
			'0xFFE01F32'
		],
		[
			'gedehari',
			'gedehari',
			'Base de Waveform no Editor de Chart',
			'https://twitter.com/gedehari',
			'0xFFFF9300'
		],
		[
			'Keoiki',
			'keoiki',
			'Animações de Note Splash',
			'https://twitter.com/Keoiki_',
			'0xFFFFFFFF'
		],
		[
			'bubba',
			'bubba',
			'Compositor Convidado de "Hot Dilf"',
			'https://www.youtube.com/channel/UCxQTnLmv0OAS63yzk9pVfaw',
			'0xFF61536A'
		],
		[
			''
		],
		[
			"Funkin' Crew"
		],
		[
			'ninjamuffin99',
			'ninjamuffin99',
			"Programador do Friday Night Funkin'",
			'https://twitter.com/ninja_muffin99',
			'0xFFF73838'
		],
		[
			'PhantomArcade',
			'phantomarcade',
			"Animador do Friday Night Funkin'",
			'https://twitter.com/PhantomArcade3K',
			'0xFFFFBB1B'
		],
		[
			'evilsk8r',
			'evilsk8r',
			"Artista do Friday Night Funkin'",
			'https://twitter.com/evilsk8r',
			'0xFF53E52C'
		],
		[
			'kawaisprite',
			'kawaisprite',
			"Compositor do Friday Night Funkin'",
			'https://twitter.com/kawaisprite',
			'0xFF6475F3'
		],
		[
			''
		],
		[
			'Banido'
		],
		[
			'Suki',
			'suki',
			'Só atrapalhou no desenvolvimento >:(',
			'https://youtu.be/mMF-cGy3Yhk',
			'0xFFd41c53'
		]
	];
		
		
				for(i in pisspoop){
					creditsStuff.push(i);
				}
			
		for (i in 0...creditsStuff.length)
		{
			var isSelectable:Bool = !unselectableCheck(i);
			var optionText:Alphabet = new Alphabet(0, 70 * i, creditsStuff[i][0], !isSelectable, false);
			optionText.isMenuItem = true;
			optionText.screenCenter(X);
			if(isSelectable) {
				optionText.x -= 70;
			}
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

		bg.color = Std.parseInt(creditsStuff[curSelected][4]);
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

		var newColor:Int =  Std.parseInt(creditsStuff[curSelected][4]);
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
