package forms.friends.list
{
   import alternativa.tanks.model.friends.FriendsService;
   import forms.friends.list.renderer.FriendsAcceptedListRenderer;
   import forms.friends.list.renderer.HeaderAcceptedList;
   import forms.friends.name_2309;
   import package_460.FriendsDataProvider;
   
   public class AcceptedList extends FriendsList implements name_2309
   {
      
      public static var var_3002:Boolean;
       
      
      private var var_936:HeaderAcceptedList;
      
      public function AcceptedList()
      {
         this.var_936 = new HeaderAcceptedList();
         super();
         init(FriendsAcceptedListRenderer);
         _dataProvider.getItemAtHandler = this.method_1461;
         addChild(this.var_936);
      }
      
      private function method_1461(param1:Object) : void
      {
         if(!method_1161(param1) && Boolean(param1.isNew))
         {
            method_1462(param1);
            FriendsService.method_1178(param1.uid);
         }
      }
      
      public function name_2307() : void
      {
         _dataProvider.sortOn([FriendsDataProvider.name_3015,FriendsDataProvider.name_3018,FriendsDataProvider.name_3017,FriendsDataProvider.name_3016],[Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
         method_2796(FriendsService.name_398);
         var_3000.scrollToIndex(2);
         this.resize(_width,_height);
      }
      
      public function method_2800(param1:String, param2:int, param3:int, param4:Boolean) : void
      {
         method_2798(param1,param2,param3,param4);
      }
      
      override public function resize(param1:Number, param2:Number) : void
      {
         _width = param1;
         _height = param2;
         AcceptedList.var_3002 = var_3000.verticalScrollBar.visible;
         this.var_936.width = _width;
         var_3000.y = 20;
         var_3000.width = AcceptedList.var_3002 ? Number(Number(_width + 6)) : Number(Number(_width));
         var_3000.height = _height - 20;
      }
      
      public function name_2304() : void
      {
         _dataProvider.removeAll();
         _dataProvider.refresh();
         this.resize(_width,_height);
      }
      
      public function hide() : void
      {
         if(parent.contains(this))
         {
            parent.removeChild(this);
            _dataProvider.removeAll();
         }
      }
      
      public function filter(param1:String, param2:String) : void
      {
         method_1464(param1,param2);
         this.resize(_width,_height);
      }
      
      public function method_1420() : void
      {
         _dataProvider.method_1420();
         this.resize(_width,_height);
      }
   }
}
