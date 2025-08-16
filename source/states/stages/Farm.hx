package states.stages;

import states.PlayState;
import objects.BGSprite;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Farm extends BaseStage
{
override function create()
{
    PlayState.instance.defaultCamZoom = 0.8;
	
	var skyType:String = PlayState.curStage == 'farm-night' ? 'sky_night' : PlayState.curStage == 'farm-sunset' ? 'sky_sunset' : 'sky';
				
    //public function new(image:String, x:Float = 0, y:Float = 0, ?scrollX:Float = 1, ?scrollY:Float = 1, ?animArray:Array<String> = null, ?loop:Bool = false) {

	var bg:BGSprite = new BGSprite('skys/${skyType}', -600, -300, 0.6, 0.6);
	add(bg);

	if (PlayState.SONG.song.toLowerCase() == 'maze')
	{
		var sunsetBG:BGSprite = new BGSprite('skys/sky_sunset', -600, -200, 0.6, 0.6);
		sunsetBG.alpha = 0;
		add(sunsetBG);

		var nightBG:BGSprite = new BGSprite('skys/sky_night', -600, -200, 0.6, 0.6);
		nightBG.alpha = 0;
		add(nightBG);
	}
	
    var flatgrass:BGSprite = new BGSprite('farm/gm_flatgrass', 350, 75, 0.65, 0.65);
	flatgrass.setGraphicSize(Std.int(flatgrass.width * 0.34));
	flatgrass.updateHitbox();
	add(flatgrass);
				
	var hills:BGSprite = new BGSprite('farm/orangey hills', -173, 100, 0.65, 0.65);
	add(hills);
				
	var farmHouse:BGSprite = new BGSprite('farm/funfarmhouse', 100, 125, 0.7, 0.7);
	farmHouse.setGraphicSize(Std.int(farmHouse.width * 0.9));
	farmHouse.updateHitbox();

	var grassLand:BGSprite = new BGSprite('farm/grass lands', -600, 500);

	var cornFence:BGSprite = new BGSprite('farm/cornFence', -400, 200);
				
	var cornFence2:BGSprite = new BGSprite('farm/cornFence2', 1100, 200);

	var bagType = FlxG.random.int(0, 1000) == 0 ? 'popeye' : 'cornbag';
	var cornBag:BGSprite = new BGSprite('farm/$bagType', 1200, 550);
				
	var sign:BGSprite = new BGSprite('farm/sign', 0, 350);

	var variantColor:FlxColor = PlayState.instance.getBackgroundColor(PlayState.curStage);
				
	flatgrass.color = variantColor;
	hills.color = variantColor;
	farmHouse.color = variantColor;
	grassLand.color = variantColor;
	cornFence.color = variantColor;
	cornFence2.color = variantColor;
	cornBag.color = variantColor;
	sign.color = variantColor;
				
				add(flatgrass);
				add(hills);
				add(farmHouse);
				add(grassLand);
				add(cornFence);
				add(cornFence2);
				add(cornBag);
				add(sign);

				/*if (['blocked', 'corn-theft', 'maze', 'mealie', 'indignancy'].contains(PlayState.SONG.song.toLowerCase()) && !MathGameState.failedGame && FlxG.random.int(0, 4) == 0)
				{
					FlxG.mouse.visible = true;
					baldi = new BGSprite('baldi', 400, 110, 'farm/baldo', 0.65, 0.65);
					baldi.setGraphicSize(Std.int(baldi.width * 0.31));
					baldi.updateHitbox();
					baldi.color = variantColor;
					insert(members.indexOf(hills), baldi);
					insert(members.indexOf(hills), baldi);
				}
                */

				if (PlayState.SONG.song.toLowerCase() == 'splitathon')
				{
					var picnic:BGSprite = new BGSprite('farm/picnic_towel_thing', 1050, 650);
					insert(members.indexOf(cornBag), picnic);
					picnic.color = variantColor;
					insert(members.indexOf(cornBag), picnic);
				}
            }


    override function stepHit()
    {
        var playOnce:Bool = false;
        switch(PlayState.SONG.song.toLowerCase().replace(" ", "-"))
        {
            case "blocked":
                if (!playOnce)
                {
                    trace("TODO: Add stuff here");
                    playOnce = true;
                }

            case "corn-theft":
                switch (curStep)
                {
                    case 1034:
                        FlxTween.tween(PlayState.instance.dadGroup, {alpha: 0}, FlxEase.expoOut(0.1));

                    case 1040:
                        FlxTween.tween(PlayState.instance.dadGroup, {alpha: 1}, FlxEase.expoOut(0.1));
                }
        }
    }
}


