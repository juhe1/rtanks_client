package package_446
{
   import alternativa.tanks.model.friends.FriendsService;
   import alternativa.tanks.model.friends.NewFriendEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class name_3092 extends Sprite
   {
      
      public static var var_2639:Class = name_3492;
      
      private static var var_2640:BitmapData = Bitmap(new var_2639()).bitmapData;
       
      
      private var var_1308:Bitmap;
      
      public function name_3092()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.var_1308 = new Bitmap(var_2640);
         addChild(this.var_1308);
         this.method_3193();
         FriendsService.method_1179().addEventListener(NewFriendEvent.ACCEPTED_CHANGE,this.method_3194);
         FriendsService.method_1179().addEventListener(NewFriendEvent.INCOMING_CHANGE,this.method_3195);
      }
      
      private function method_3193() : void
      {
         this.visible = FriendsService.method_1181 + FriendsService.method_1176 > 0;
      }
      
      private function method_3195(param1:NewFriendEvent) : void
      {
         this.method_3193();
      }
      
      private function method_3194(param1:NewFriendEvent) : void
      {
         this.method_3193();
      }
   }
}
