package alternativa.tanks.models.sfx
{
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.lights.SpotLight;
   import alternativa.engine3d.lights.TubeLight;
   
   public final class LightAnimation
   {
       
      
      private var name_1811:int;
      
      private var time:Vector.<uint>;
      
      private var intensity:Vector.<Number>;
      
      private var color:Vector.<uint>;
      
      private var attenuationBegin:Vector.<Number>;
      
      private var attenuationEnd:Vector.<Number>;
      
      public function LightAnimation(param1:Vector.<name_2330>)
      {
         var _loc2_:name_2330 = null;
         super();
         this.name_1811 = param1.length;
         this.intensity = new Vector.<Number>(this.name_1811,true);
         this.color = new Vector.<uint>(this.name_1811,true);
         this.attenuationBegin = new Vector.<Number>(this.name_1811,true);
         this.attenuationEnd = new Vector.<Number>(this.name_1811,true);
         this.time = new Vector.<uint>(this.name_1811,true);
         var _loc3_:int = 0;
         while(_loc3_ < this.name_1811)
         {
            _loc2_ = param1[_loc3_];
            this.intensity[_loc3_] = Number(_loc2_.intensity);
            this.color[_loc3_] = uint(_loc2_.color);
            this.attenuationBegin[_loc3_] = Number(_loc2_.attenuationBegin);
            this.attenuationEnd[_loc3_] = Number(_loc2_.attenuationEnd);
            this.time[_loc3_] = uint(_loc2_.time);
            _loc3_++;
         }
      }
      
      private static function method_834(param1:Number, param2:Number, param3:Number) : Number
      {
         return param1 + (param2 - param1) * param3;
      }
      
      private static function method_839(param1:uint, param2:uint, param3:Number) : uint
      {
         var _loc4_:Number = (param1 >> 16 & 255) / 255;
         var _loc5_:Number = (param1 >> 8 & 255) / 255;
         var _loc6_:Number = (param1 & 255) / 255;
         var _loc7_:Number = (param2 >> 16 & 255) / 255;
         var _loc8_:Number = (param2 >> 8 & 255) / 255;
         var _loc9_:Number = (param2 & 255) / 255;
         var _loc10_:int = method_834(_loc4_,_loc7_,param3) * 255;
         var _loc11_:int = method_834(_loc5_,_loc8_,param3) * 255;
         var _loc12_:int = method_834(_loc6_,_loc9_,param3) * 255;
         return _loc10_ << 16 | _loc11_ << 8 | _loc12_;
      }
      
      private function method_2049(param1:Number) : Number
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = 0;
         if(param1 < this.time[this.name_1811 - 1])
         {
            _loc2_ = 0;
            while(_loc2_ < this.name_1811 - 1)
            {
               _loc3_ = this.time[_loc2_];
               _loc4_ = this.time[_loc2_ + 1];
               if(param1 >= _loc3_ && param1 < _loc4_)
               {
                  _loc5_ = (param1 - _loc3_) / (_loc4_ - _loc3_);
                  _loc6_ = _loc2_ + _loc5_;
                  break;
               }
               _loc2_++;
            }
         }
         else
         {
            _loc6_ = this.name_1811 - 1;
         }
         return _loc6_;
      }
      
      public function method_2055() : int
      {
         return this.name_1811;
      }
      
      private function method_2047(param1:int) : int
      {
         return param1 < this.name_1811 ? int(int(param1)) : int(int(this.name_1811 - 1));
      }
      
      private function method_2052(param1:Number, param2:SpotLight) : void
      {
         var _loc3_:int = this.method_2047(Math.floor(param1));
         var _loc4_:int = this.method_2047(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = method_834(_loc6_,_loc7_,_loc5_);
         param2.color = method_839(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = method_834(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = method_834(_loc12_,_loc13_,_loc5_);
      }
      
      private function method_2050(param1:Number, param2:OmniLight) : void
      {
         var _loc3_:int = this.method_2047(Math.floor(param1));
         var _loc4_:int = this.method_2047(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = method_834(_loc6_,_loc7_,_loc5_);
         param2.color = method_839(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = method_834(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = method_834(_loc12_,_loc13_,_loc5_);
      }
      
      private function method_2051(param1:Number, param2:TubeLight) : void
      {
         var _loc3_:int = this.method_2047(Math.floor(param1));
         var _loc4_:int = this.method_2047(Math.ceil(param1));
         var _loc5_:Number = param1 - _loc3_;
         var _loc6_:Number = this.intensity[_loc3_];
         var _loc7_:Number = this.intensity[_loc4_];
         var _loc8_:uint = this.color[_loc3_];
         var _loc9_:uint = this.color[_loc4_];
         var _loc10_:Number = this.attenuationBegin[_loc3_];
         var _loc11_:Number = this.attenuationBegin[_loc4_];
         var _loc12_:Number = this.attenuationEnd[_loc3_];
         var _loc13_:Number = this.attenuationEnd[_loc4_];
         param2.intensity = method_834(_loc6_,_loc7_,_loc5_);
         param2.color = method_839(_loc8_,_loc9_,_loc5_);
         param2.attenuationBegin = method_834(_loc10_,_loc11_,_loc5_);
         param2.attenuationEnd = method_834(_loc12_,_loc13_,_loc5_);
      }
      
      public function method_2054(param1:Light3D, param2:int, param3:int = -1) : void
      {
         var _loc4_:Number = 1;
         if(param3 > 0 && this.name_1811 > 0)
         {
            _loc4_ = this.time[this.name_1811 - 1] / param3;
         }
         var _loc5_:Number = this.method_2049(param2 * _loc4_);
         this.method_2048(param1,_loc5_);
      }
      
      private function method_2048(param1:Light3D, param2:Number) : void
      {
         if(param1 is OmniLight)
         {
            this.method_2050(param2,OmniLight(param1));
         }
         else if(param1 is SpotLight)
         {
            this.method_2052(param2,SpotLight(param1));
         }
         else if(param1 is TubeLight)
         {
            this.method_2051(param2,TubeLight(param1));
         }
         param1.calculateBounds();
      }
      
      public function method_2053() : int
      {
         return this.time[this.name_1811 - 1];
      }
   }
}
