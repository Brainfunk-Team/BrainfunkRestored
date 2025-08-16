package states.stages;

import states.PlayState;

class House extends BaseStage
{
    override function create()
    {
        var charY:Float = 170;
		PlayState.instance.defaultCamZoom = 0.7;
        PlayState.instance.boyfriendGroup.x = 843;
        PlayState.instance.boyfriendGroup.y = charY;
        PlayState.instance.dadGroup.x = 50;
        PlayState.instance.dadGroup.y = charY;
        PlayState.instance.gfGroup.x = 300;
        PlayState.instance.gfGroup.y = 60;

        PlayState.instance.boyfriendCameraOffset = [0, -100];
				
		var skyType:String = '';
		var assetType:String = '';
		switch (PlayState.curStage)
		{
			case 'house':
				skyType = 'sky';
			case 'house-night':
                skyType = 'sky_night';
				assetType = 'night/';
			case 'house-sunset':
				skyType = 'sky_sunset';
		}
        // reference: public function new(image:String, x:Float = 0, y:Float = 0, ?scrollX:Float = 1, ?scrollY:Float = 1, ?animArray:Array<String> = null, ?loop:Bool = false) 
		var bg:BGSprite = new BGSprite('skys/${skyType}', -600, -300, 0.6, 0.6);
		add(bg);
				
		var stageHills:BGSprite = new BGSprite('dave-house/${assetType}hills', -834, -159, 0.7, 0.7);
		add(stageHills);

		var grassbg:BGSprite = new BGSprite('dave-house/${assetType}grass bg', -1205, 580);
		add(grassbg);
	
		var gate:BGSprite = new BGSprite('dave-house/${assetType}gate', -755, 250);
		add(gate);
	
	    var stageFront:BGSprite = new BGSprite('dave-house/${assetType}grass', -832, 505);
		add(stageFront);

    }
}