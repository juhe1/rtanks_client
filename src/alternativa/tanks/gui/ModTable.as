package alternativa.tanks.gui
{
   import controls.base.name_1134;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class ModTable extends Sprite
   {
      
      private static const const_2781:Class = name_3543;
      
      private static const const_2778:BitmapData = new const_2781().bitmapData;
      
      private static const const_2780:Class = name_3542;
      
      private static const const_2779:BitmapData = new const_2780().bitmapData;
      
      private static const const_2782:Class = name_3544;
      
      private static const const_2777:BitmapData = new const_2782().bitmapData;
       
      
      private var var_3610:int;
      
      public var name_3214:int;
      
      public var name_3240:Array;
      
      public const const_2783:int = 0;
      
      private var var_3608:Shape;
      
      private var var_3609:int = -1;
      
      private var var_3611:Boolean;
      
      private var rowCount:int = 4;
      
      private var _width:int;
      
      public function ModTable(param1:int)
      {
         var _loc2_:ModInfoRow = null;
         super();
         this._width = param1;
         this.name_3240 = new Array();
         this.var_3608 = new Shape();
         addChild(this.var_3608);
         this.var_3608.x = 3;
         var _loc3_:int = 0;
         while(_loc3_ < this.rowCount)
         {
            _loc2_ = new ModInfoRow(this._width);
            addChild(_loc2_);
            _loc2_.y = (17 + 0) * _loc3_;
            this.name_3240.push(_loc2_);
            _loc2_.var_2360.value = _loc3_;
            _loc3_++;
         }
      }
      
      public function name_3247(param1:int) : void
      {
         var _loc4_:ModInfoRow = null;
         var _loc2_:ModInfoRow = null;
         var _loc3_:int = 0;
         _loc4_ = null;
         this.rowCount = param1;
         for each(_loc2_ in this.name_3240)
         {
            removeChild(_loc2_);
         }
         this.name_3240 = new Array();
         _loc3_ = 0;
         while(_loc3_ < this.rowCount)
         {
            _loc4_ = new ModInfoRow(this._width);
            if(param1 == 1)
            {
               _loc4_.method_3225();
            }
            addChild(_loc4_);
            _loc4_.y = (17 + 0) * _loc3_;
            this.name_3240.push(_loc4_);
            _loc4_.var_2360.value = _loc3_;
            _loc3_++;
         }
      }
      
      public function name_1879(param1:int) : void
      {
         var _loc2_:ModInfoRow = null;
         if(this.var_3609 != -1)
         {
            _loc2_ = ModInfoRow(this.name_3240[this.var_3609]);
            if(_loc2_ != null)
            {
               _loc2_.name_2631();
            }
         }
         this.var_3609 = param1;
         this.var_3608.y = (ModInfoRow(this.name_3240[0]).h + 0) * param1;
         this.var_3608.visible = true;
         _loc2_ = ModInfoRow(this.name_3240[this.var_3609]);
         if(_loc2_ != null)
         {
            _loc2_.name_1879();
         }
      }
      
      public function method_3228() : void
      {
         var _loc1_:ModInfoRow = null;
         this.var_3608.visible = false;
         if(this.var_3609 != -1)
         {
            _loc1_ = this.name_3240[this.var_3609];
            _loc1_.name_2631();
         }
         this.var_3609 = -1;
      }
      
      public function name_3243(param1:int) : void
      {
         var _loc2_:int = param1 - 6;
         var _loc3_:Matrix = new Matrix();
         this.var_3608.graphics.clear();
         this.var_3608.graphics.beginBitmapFill(const_2778);
         this.var_3608.graphics.drawRect(0,0,const_2778.width,const_2778.height);
         this.var_3608.graphics.beginBitmapFill(const_2779);
         this.var_3608.graphics.drawRect(const_2778.width,0,_loc2_ - const_2778.width - const_2777.width,const_2779.height);
         _loc3_.tx = _loc2_ - const_2777.width;
         this.var_3608.graphics.beginBitmapFill(const_2777,_loc3_);
         this.var_3608.graphics.drawRect(_loc2_ - const_2777.width,0,const_2777.width,const_2777.height);
      }
      
      public function name_3246() : void
      {
         var _loc1_:int = 0;
         var _loc2_:name_1134 = null;
         var _loc3_:int = 0;
         var _loc4_:Array = new Array();
         var _loc5_:ModInfoRow = this.name_3240[0] as ModInfoRow;
         var _loc6_:int = int(_loc5_.labels.length);
         var _loc7_:int = 0;
         while(_loc7_ < this.rowCount)
         {
            _loc5_ = this.name_3240[_loc7_] as ModInfoRow;
            _loc1_ = 0;
            while(_loc1_ < _loc6_)
            {
               _loc2_ = _loc5_.labels[_loc1_] as name_1134;
               if(_loc2_.text.indexOf(".") != -1)
               {
                  _loc4_.push(_loc1_);
               }
               _loc1_++;
            }
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < this.rowCount)
         {
            _loc5_ = this.name_3240[_loc7_];
            _loc1_ = 0;
            while(_loc1_ < _loc4_.length)
            {
               _loc3_ = int(_loc4_[_loc1_]);
               _loc2_ = _loc5_.labels[_loc3_] as name_1134;
               if(_loc2_.text.indexOf(".") == -1)
               {
                  _loc2_.text += ".0";
               }
               _loc1_++;
            }
            _loc7_++;
         }
      }
      
      public function get maxCostWidth() : int
      {
         return this.var_3610;
      }
      
      public function set maxCostWidth(param1:int) : void
      {
         this.var_3610 = param1;
         var _loc2_:ModInfoRow = this.name_3240[0] as ModInfoRow;
         this.name_3214 = _loc2_.var_2360.width + _loc2_.const_126.width + 3 + _loc2_.var_1841.width + this.var_3610 + 10 * 3;
         var _loc3_:int = 0;
         while(_loc3_ < this.rowCount)
         {
            _loc2_ = this.name_3240[_loc3_] as ModInfoRow;
            _loc2_.var_3605 = this.var_3610;
            _loc3_++;
         }
      }
   }
}
