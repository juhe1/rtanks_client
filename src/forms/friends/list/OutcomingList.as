package forms.friends.list
{
   import alternativa.tanks.model.friends.FriendsService;
   import forms.friends.list.renderer.FriendsOutgoingListRenderer;
   import forms.friends.name_2309;
   
   public class OutcomingList extends FriendsList implements name_2309
   {
       
      
      public function OutcomingList()
      {
         super();
         init(FriendsOutgoingListRenderer);
         _dataProvider.getItemAtHandler = this.method_1461;
      }
      
      private function method_1461(param1:Object) : void
      {
         if(!method_1161(param1) && Boolean(param1.isNew))
         {
            method_1462(param1);
         }
      }
      
      public function name_2307() : void
      {
         _dataProvider.sortOn(["uid"],[Array.CASEINSENSITIVE]);
         method_2799(FriendsService.name_398);
         var_3000.scrollToIndex(2);
         resize(_width,_height);
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
         resize(_width,_height);
      }
      
      public function method_1420() : void
      {
         _dataProvider.method_1420();
         resize(_width,_height);
      }
   }
}
