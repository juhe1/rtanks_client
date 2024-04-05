package forms.friends.list.renderer
{
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import package_54.name_102;
   
   public class HeaderAcceptedList extends Sprite
   {
      
      public static var localeService:name_102;
      
      public static var var_1155:Vector.<HeaderData>;
       
      
      protected var var_1207:Vector.<Number>;
      
      protected var _width:int = 800;
      
      public function HeaderAcceptedList()
      {
         var _loc1_:name_3481 = null;
         this.var_1207 = new Vector.<Number>();
         super();
         var_1155 = Vector.<HeaderData>([new HeaderData("Имя",TextFormatAlign.LEFT,2),new HeaderData("Битвы",TextFormatAlign.LEFT,2)]);
         var _loc2_:int = int(var_1155.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = new name_3481(var_1155[_loc3_].align);
            _loc1_.label = var_1155[_loc3_].text;
            _loc1_.name_1872(var_1155[_loc3_].posX);
            _loc1_.height = 18;
            addChild(_loc1_);
            _loc3_++;
         }
         this.draw();
      }
      
      protected function draw() : void
      {
         var _loc1_:name_3481 = null;
         _loc1_ = null;
         this.var_1207 = Vector.<Number>([0,this._width / 2,this._width - 1]);
         var _loc2_:int = int(var_1155.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = getChildAt(_loc3_) as name_3481;
            _loc1_.width = this.var_1207[_loc3_ + 1] - this.var_1207[_loc3_] - 2;
            _loc1_.x = this.var_1207[_loc3_];
            _loc3_++;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = Math.floor(param1);
         this.draw();
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
