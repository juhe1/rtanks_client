package package_211
{
   import base.class_122;
   import flash.text.TextFormatAlign;
   import package_215.name_1871;
   import package_54.name_102;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class HeaderClanCandidateList extends class_122
   {
      
      public static var localeService:name_102;
      
      public static var var_1155:Vector.<HeaderData>;
      
      public static var var_1207:Vector.<Number> = Vector.<Number>([1]);
      
      private static const const_1533:int = 2;
       
      
      protected var _width:int = 800;
      
      private var var_1208:Vector.<name_1871>;
      
      public function HeaderClanCandidateList()
      {
         var _loc1_:name_1871 = null;
         _loc1_ = null;
         this.var_1208 = new Vector.<name_1871>();
         super();
         var_1155 = Vector.<HeaderData>([new HeaderData(localeService.getText(name_390.const_576),TextFormatAlign.LEFT,2)]);
         var _loc2_:int = int(var_1155.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = new name_1871(var_1155[_loc3_].align);
            _loc1_.label = var_1155[_loc3_].text;
            _loc1_.name_1872(var_1155[_loc3_].posX);
            _loc1_.height = 18;
            addChild(_loc1_);
            this.var_1208.push(_loc1_);
            _loc3_++;
         }
         this.align();
      }
      
      protected function align() : void
      {
         var _loc1_:name_1871 = null;
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         _loc1_ = null;
         _loc2_ = int(var_1155.length);
         var _loc3_:Number = 2 - 1;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ = this.var_1208[_loc4_];
            _loc1_.width = var_1207[_loc4_] * (this._width + 2 - 2 * (var_1207.length + 1));
            _loc1_.x = _loc3_;
            _loc1_.y = 1;
            if(_loc4_ != _loc2_ - 1)
            {
               _loc3_ += _loc1_.width + 2;
            }
            _loc4_++;
         }
         this.var_1208[this.var_1208.length - 1].width = this._width + 3 - _loc3_ - 2 * 2;
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.align();
      }
   }
}

class HeaderData
{
    
   
   public var text:String;
   
   public var align:String;
   
   public var posX:int;
   
   public function HeaderData(param1:String, param2:String, param3:int)
   {
      super();
      this.text = param1;
      this.align = param2;
      this.posX = param3;
   }
}
