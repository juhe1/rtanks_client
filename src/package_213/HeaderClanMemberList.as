package package_213
{
   import base.class_122;
   import flash.text.TextFormatAlign;
   import package_215.name_1871;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class HeaderClanMemberList extends class_122
   {
      
      public static var localeService:name_102;
      
      public static var var_1155:Vector.<HeaderData>;
      
      private static var var_1157:Vector.<Number> = Vector.<Number>([0.16,0.2,0.08,0.08,0.08,0.08,0.16,0.16]);
      
      private static var var_1156:Vector.<Number> = new Vector.<Number>();
      
      private static var var_1159:Vector.<Number> = Vector.<Number>([5,4,3,2,6,7,1]);
      
      protected static var _width:Number = 840;
      
      private static var var_1158:Number = 2;
      
      private static var header:HeaderClanMemberList;
       
      
      public function HeaderClanMemberList()
      {
         var _loc1_:name_1871 = null;
         _loc1_ = null;
         super();
         header = this;
         var_1155 = Vector.<HeaderData>([new HeaderData(localeService.getText(name_390.const_576),TextFormatAlign.LEFT,2,180),new HeaderData(localeService.getText(name_390.const_1075),TextFormatAlign.LEFT,2,168),new HeaderData(localeService.getText(name_390.const_1259),TextFormatAlign.LEFT,2,67),new HeaderData(localeService.getText(name_390.const_1263),TextFormatAlign.LEFT,2,80),new HeaderData(localeService.getText(name_390.const_517),TextFormatAlign.LEFT,2,67),new HeaderData(localeService.getText(name_390.const_527),TextFormatAlign.LEFT,2,53),new HeaderData(localeService.getText(name_390.const_1284),TextFormatAlign.LEFT,2,134),new HeaderData(localeService.getText(name_390.const_1063),TextFormatAlign.LEFT,2,134)]);
         var _loc2_:int = int(var_1155.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = new name_1871(var_1155[_loc3_].align);
            _loc1_.label = var_1155[_loc3_].text;
            _loc1_.name_1872(var_1155[_loc3_].posX);
            _loc1_.height = 18;
            addChild(_loc1_);
            _loc3_++;
         }
      }
      
      public static function method_1415(param1:int) : Number
      {
         return header.getChildAt(param1).x;
      }
      
      public static function method_1414(param1:int) : Number
      {
         if(header.getChildAt(param1).visible)
         {
            return Math.max(header.getChildAt(param1).width,var_1155[param1].minWidth);
         }
         return 0;
      }
      
      public static function method_1416() : Number
      {
         return method_1414(1);
      }
      
      protected function resize() : void
      {
         var _loc5_:int = 0;
         var _loc7_:Vector.<Number> = null;
         var _loc1_:name_1871 = null;
         var _loc2_:Number = NaN;
         var_1156 = new Vector.<Number>();
         var _loc3_:int = 0;
         if(_width <= 985)
         {
            _loc3_ = 5 - (_width - 585) / 80;
         }
         var_1156 = var_1159.slice(0,_loc3_);
         var _loc4_:Number = 0;
         _loc5_ = 0;
         while(_loc5_ < var_1155.length)
         {
            if(var_1156.indexOf(_loc5_) < 0)
            {
               _loc4_ += var_1157[_loc5_];
            }
            _loc5_++;
         }
         var _loc6_:Number = 0;
         _loc7_ = new Vector.<Number>();
         _loc5_ = 0;
         while(_loc5_ < var_1155.length)
         {
            _loc7_.push(var_1157[_loc5_] / _loc4_);
            _loc6_ += _loc7_[_loc5_];
            _loc5_++;
         }
         var _loc8_:int = 1;
         _loc5_ = 0;
         while(_loc5_ < var_1155.length)
         {
            _loc1_ = getChildAt(_loc5_) as name_1871;
            if(var_1156.indexOf(_loc5_) < 0)
            {
               _loc1_.y = 1;
               _loc1_.x = _loc8_;
               _loc2_ = _loc7_[_loc5_] / _loc6_ * (_width + 2 - var_1158 * (var_1157.length - var_1156.length + 1));
               _loc1_.width = Math.max(_loc2_,var_1155[_loc5_].minWidth);
               if(_loc5_ < var_1155.length - 1)
               {
                  _loc8_ += _loc1_.width + var_1158;
               }
               _loc1_.visible = true;
            }
            else
            {
               _loc1_.visible = false;
            }
            _loc5_++;
         }
         getChildAt(numChildren - 1).width = _width + 3 - _loc8_ - 2 * var_1158;
      }
      
      override public function set width(param1:Number) : void
      {
         _width = param1;
         this.resize();
      }
   }
}

class HeaderData
{
    
   
   public var text:String;
   
   public var align:String;
   
   public var posX:int;
   
   public var minWidth:Number;
   
   public function HeaderData(param1:String, param2:String, param3:int, param4:Number = 0)
   {
      super();
      this.text = param1;
      this.align = param2;
      this.posX = param3;
      this.minWidth = param4;
   }
}
