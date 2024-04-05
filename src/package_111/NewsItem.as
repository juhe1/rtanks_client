package package_111
{
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   
   public class NewsItem extends Sprite
   {
       
      
      private var date:Label;
      
      private var text:Label;
      
      private var image:Bitmap;
      
      public function NewsItem()
      {
         this.date = new Label();
         this.text = new Label();
         super();
         this.date.color = 65280;
         this.date.x = 10;
         this.text.color = 8454016;
         this.text.x = 100;
         this.text.y = 20;
         this.text.multiline = true;
         this.text.wordWrap = true;
         this.text.align = TextFormatAlign.LEFT;
         this.text.width = 365;
         addChild(this.date);
         addChild(this.text);
      }
      
      public function set name_1661(param1:String) : void
      {
         this.date.text = param1;
      }
      
      public function set name_1660(param1:String) : void
      {
         var _loc2_:RegExp = /((^|\s)(http(s)?:\/\/)?(www\.)?((([a-z0-9]+)\.){1,4})([a-z]{2,10})(\/[a-z0-9\.\%\-\/\?=\:&]*)?(#([a-z0-9\.\%\-\/\?=\:&]*))?($|\s))/gi;
         var _loc3_:int = 0;
         var _loc4_:String = param1;
         _loc3_ = _loc4_.search(_loc2_);
         if(_loc3_ > -1)
         {
            _loc4_ = _loc4_.replace(_loc2_,"<u><a href=\'event:" + param1.split(_loc2_)[1] + "\'>" + param1.split(_loc2_)[1] + "</a></u>");
            this.text.htmlText = _loc4_;
         }
         else
         {
            this.text.text = param1;
         }
      }
      
      public function set name_1659(param1:String) : void
      {
         this.image = new Bitmap(NewsIcons.method_2322(param1));
         this.image.x = 15;
         this.image.y = 20;
         addChild(this.image);
      }
      
      public function get method_2416() : int
      {
         return this.height;
      }
   }
}
