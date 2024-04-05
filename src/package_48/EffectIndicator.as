package package_48
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.sfx.name_2384;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import package_49.name_163;
   
   public class EffectIndicator
   {
      
      private static const const_1748:int = 1;
      
      private static const const_1745:int = 2;
      
      private static const const_1746:int = 4;
      
      private static const const_1747:int = 8;
      
      private static const const_1741:Class = name_2388;
      
      private static const const_1743:Class = name_2386;
      
      private static const const_1742:Class = name_2385;
      
      private static const const_1744:Class = name_2387;
      
      private static const const_478:Number = 0.2;
      
      private static var icons:Dictionary;
      
      private static var var_1971:Rectangle;
      
      private static var matrix:Matrix = new Matrix();
       
      
      private var var_1977:int;
      
      private var icon:BitmapData;
      
      private var var_1976:int;
      
      private var colorTransform:ColorTransform;
      
      private var var_1974:int;
      
      private var blinker:name_2384;
      
      private var alpha:Number = 1;
      
      private var var_1972:Boolean;
      
      private var x:int;
      
      private var y:int;
      
      private var var_1975:UserTitle;
      
      private var state:int;
      
      private var var_1973:Boolean;
      
      public function EffectIndicator(param1:int, param2:int, param3:UserTitle, param4:int, param5:int)
      {
         this.colorTransform = new ColorTransform();
         super();
         if(icons == null)
         {
            method_2078();
         }
         this.var_1977 = param1;
         this.icon = icons[param1];
         this.var_1976 = param2;
         this.var_1975 = param3;
         this.blinker = new name_2384(param4,20,param5,0.2,1,10);
         this.state = 1;
      }
      
      private static function method_2078() : void
      {
         icons = new Dictionary();
         icons[name_163.name_196] = Bitmap(new const_1741()).bitmapData;
         icons[name_163.ARMOR] = Bitmap(new const_1743()).bitmapData;
         icons[name_163.name_474] = Bitmap(new const_1742()).bitmapData;
         icons[name_163.NITRO] = Bitmap(new const_1744()).bitmapData;
         var_1971 = BitmapData(icons[name_163.name_196]).rect;
      }
      
      public function get effectId() : int
      {
         return this.var_1977;
      }
      
      public function method_213() : Boolean
      {
         return (this.state & 4) != 0;
      }
      
      public function name_885() : Boolean
      {
         return this.state == 1;
      }
      
      public function show(param1:int) : void
      {
         this.state &= ~8;
         if(this.state != 4 || this.alpha != 1)
         {
            this.var_1972 = true;
         }
         this.var_1974 = getTimer() + param1 - this.var_1976;
         this.var_1973 = false;
         this.alpha = 1;
         if(this.state == 1)
         {
            this.state = 2;
         }
      }
      
      public function hide() : void
      {
         if(this.state == 2)
         {
            this.var_1975.method_672(this);
            this.state = 1;
            return;
         }
         if((this.state & (1 | 8)) != 0)
         {
            return;
         }
         this.state |= 8;
         this.blinker.name_2389(0);
         if(!this.var_1973)
         {
            this.var_1974 = 0;
            this.blinker.init(getTimer());
            this.var_1973 = true;
         }
      }
      
      public function clear(param1:BitmapData) : void
      {
         if(this.state == 1 || this.state == 2)
         {
            return;
         }
         var_1971.x = this.x;
         var_1971.y = this.y;
         param1.fillRect(var_1971,0);
      }
      
      public function name_731(param1:int, param2:int) : void
      {
         this.x = param1;
         this.y = param2;
         this.var_1972 = true;
      }
      
      public function name_1144() : void
      {
         this.var_1972 = true;
      }
      
      public function update(param1:int, param2:int, param3:BitmapData, param4:TextureMaterial) : void
      {
         if(this.state == 1)
         {
            return;
         }
         if(this.var_1972)
         {
            this.draw(param3,param4);
            this.var_1972 = false;
         }
         if(param1 > this.var_1974)
         {
            this.method_2079(param1,param2,param3,param4);
         }
         if(this.state == 2)
         {
            this.state = 4;
         }
      }
      
      private function method_2079(param1:int, param2:int, param3:BitmapData, param4:TextureMaterial) : void
      {
         var _loc5_:Number = NaN;
         if(this.var_1973)
         {
            _loc5_ = this.blinker.name_2390(param1,param2);
            if(_loc5_ != this.alpha)
            {
               this.alpha = _loc5_;
               this.draw(param3,param4);
            }
            if((this.state & 8) != 0 && this.alpha <= 0)
            {
               this.var_1975.method_672(this);
               this.state = 1;
            }
         }
         else
         {
            this.blinker.name_2389(0.2);
            this.blinker.init(param1);
            this.var_1973 = true;
         }
      }
      
      private function draw(param1:BitmapData, param2:TextureMaterial) : void
      {
         this.clear(param1);
         matrix.tx = this.x;
         matrix.ty = this.y;
         this.colorTransform.alphaMultiplier = this.alpha;
         param1.draw(this.icon,matrix,this.colorTransform,null,null,true);
         param2.texture = param1;
      }
   }
}
