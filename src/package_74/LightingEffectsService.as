package package_74
{
   import flash.geom.ColorTransform;
   import forms.battlelist.BattleMode;
   import package_3.GPUCapabilities;
   import package_311.name_1307;
   import package_311.name_1312;
   
   public class LightingEffectsService implements name_272
   {
       
      
      private var var_692:Vector.<name_1312>;
      
      private var var_694:Number;
      
      private var var_693:ColorTransform;
      
      public function LightingEffectsService()
      {
         this.var_692 = new Vector.<name_1312>(BattleMode.method_393.length,true);
         super();
         var _loc1_:int = 0;
         while(_loc1_ < this.var_692.length)
         {
            this.var_692[_loc1_] = new name_1312(new name_1307(0,0),new name_1307(0,0),new name_1307(0,0),0,0);
            _loc1_++;
         }
      }
      
      public function setLightForMode(param1:BattleMode, param2:name_1312) : void
      {
         this.var_692[param1.value] = param2;
      }
      
      public function name_1313(param1:BattleMode) : name_1312
      {
         return this.var_692[param1.value];
      }
      
      public function setBonusLighting(param1:Number, param2:ColorTransform, param3:ColorTransform) : void
      {
         this.var_694 = param1;
         if(GPUCapabilities.method_95)
         {
            this.var_693 = param2;
         }
         else
         {
            this.var_693 = param3;
         }
      }
      
      public function method_879() : Number
      {
         return this.var_694;
      }
      
      public function method_880() : ColorTransform
      {
         return this.var_693;
      }
   }
}
