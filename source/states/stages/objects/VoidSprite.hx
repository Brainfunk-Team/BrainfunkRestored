package states.stages.objects;

import backend.Shaders.GlitchShader;
import objects.BGSprite;

class VoidSprite extends BGSprite
{
    #if SHADERS_ENABLED
    public var waveSpeed(default, set):Float = 2;
    public var waveFrequency(default, set):Float = 5;
    public var waveAmplitude(default, set):Float = 0.1;
    public var Enabled(default, set):Bool = true;

    public var glitchShader:GlitchShader;
	#end

    public function new(image:String, speed:Float = 2, freq:Float = 5, amp:Float = 0.1, ?x:Float = 0, ?y:Float = 0, ?scrollX:Float = 1, ?scrollY:Float = 1):Void
    {
        super(image, x, y, scrollX, scrollY);

		#if SHADERS_ENABLED
        glitchShader = new GlitchShader();

		glitchShader.uTime.value = [0];
		glitchShader.uSpeed.value = [speed];
		glitchShader.uFrequency.value = [freq];
		glitchShader.uWaveAmplitude.value = [amp];
		glitchShader.uEnabled.value = [true];

		waveSpeed = speed;
		waveFrequency = freq;
		waveAmplitude = amp;

		shader = glitchShader;

		trace('Image size: ' + width + 'x' + height);
		#end
	}

	#if SHADERS_ENABLED
	

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

        glitchShader.uTime.value[0] += elapsed;
		
    }

    function set_waveSpeed(v:Float):Float
    {
        waveSpeed = v;
        glitchShader.uSpeed.value[0] = v;

        return v;
    }

    function set_Enabled(v:Bool):Bool
    {
        Enabled = v;
        glitchShader.uEnabled.value[0] = v ? true : false;
		
        return v;
    }

    function set_waveFrequency(v:Float):Float
    {
        waveFrequency = v;
        glitchShader.uFrequency.value[0] = v;
		
        return v;
    }

    function set_waveAmplitude(v:Float):Float
    {
        waveAmplitude = v;
        glitchShader.uWaveAmplitude.value[0] = v;
		
        return v;
    }
    #end
}
