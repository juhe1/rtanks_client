package forms.friends.list
{
   import alternativa.tanks.model.friends.FriendsService;
   import forms.friends.list.renderer.FriendsIncomingListRenderer;
   import forms.friends.name_2309;
   import forms.friends.name_3030;
   
   public class IncomingList extends FriendsList implements name_2309
   {
       
      
      private var var_1848:name_3030;
      
      public function IncomingList(param1:name_3030)
      {
         super();
         this.var_1848 = param1;
         init(FriendsIncomingListRenderer);
         _dataProvider.getItemAtHandler = this.method_1461;
      }
      
      public function name_2307() : void
      {
         _dataProvider.sortOn(["isNew","uid"],[Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
         method_2797(FriendsService.name_398);
         this.method_2806();
         var_3000.scrollToIndex(2);
         resize(_width,_height);
      }
      
      public function name_2304() : void
      {
         _dataProvider.removeAll();
         _dataProvider.refresh();
         this.resize(_width,_height);
      }
      
      private function method_2806() : void
      {
         this.var_1848.name_3031(_dataProvider.length != 0);
      }
      
      private function method_1461(param1:Object) : void
      {
         if(!method_1161(param1) && Boolean(param1.isNew))
         {
            method_1462(param1);
         }
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
         resize(_width,_height);
      }
      
      public function method_1420() : void
      {
         _dataProvider.method_1420();
         resize(_width,_height);
      }
   }
}
