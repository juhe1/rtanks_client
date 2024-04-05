package package_111
{
   import flash.display.DisplayObjectContainer;
   import package_1.Main;
   import package_31.name_115;
   
   public class name_347 implements name_406
   {
      
      public static var var_932:Boolean = false;
       
      
      private var panelModel:name_115;
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var window:name_1662;
      
      public var news:Array;
      
      public function name_347()
      {
         this.news = new Array();
         super();
         this.dialogsLayer = Main.dialogsLayer;
      }
      
      public function name_413(param1:Vector.<name_342>) : void
      {
         var _loc2_:name_342 = null;
         var _loc3_:NewsItem = null;
         this.news = new Array();
         for each(_loc2_ in param1)
         {
            _loc3_ = new NewsItem();
            _loc3_.name_1661 = _loc2_.date;
            _loc3_.name_1660 = _loc2_.text;
            _loc3_.name_1659 = _loc2_.name_1659;
            this.news.push(_loc3_);
         }
      }
   }
}
