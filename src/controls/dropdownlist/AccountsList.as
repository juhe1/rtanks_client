package controls.dropdownlist
{
   import controls.base.name_2016;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import package_1.Main;
   import package_95.IStorageService;
   
   public class AccountsList extends DropDownList
   {
      
      public static var storageService:IStorageService = Main.osgi.getService(IStorageService) as IStorageService;
      
      public static const name_2570:int = 20;
       
      
      private var var_3701:name_3670;
      
      private var var_632:name_2016;
      
      public function AccountsList(param1:name_2016)
      {
         this.var_3701 = new name_3670();
         super();
         this.var_632 = param1;
         this.var_632.addEventListener(Event.ADDED,this.method_1601);
      }
      
      private function method_1601(param1:Event) : void
      {
         this.var_632.removeEventListener(Event.ADDED,this.method_1601);
         this.listBg.x = this.var_632.x;
         this.listBg.y = this.var_632.y + 28;
         this.var_632.parent.addChildAt(this.listBg,this.var_632.parent.getChildIndex(this.var_632));
      }
      
      override protected function init() : void
      {
         super.init();
         list.y = 30;
         list.height = 100;
         list.rowHeight = 20;
         this.listBg.height = 110;
         removeChild(button);
         addChild(this.var_3701);
         this.var_3701.y = -1;
         this.var_3701.addEventListener(MouseEvent.CLICK,method_1582);
         method_1578(AccountsRenderer);
         addEventListener(DeleteEvent.REMOVED,this.method_3300);
      }
      
      public function method_3300(param1:DeleteEvent) : void
      {
         list.removeItem(param1.data);
         close();
         selectedItem = null;
         height = Math.min(this.length,4) * 20 + 13;
         var _loc2_:Object = param1.data.data;
         var _loc3_:SharedObject = storageService.getAccountsStorage();
         delete _loc3_.data[_loc2_.userName];
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      override protected function get listBg() : DPLBackground
      {
         if(!var_1353)
         {
            var_1353 = new AccountsBackground();
         }
         return var_1353;
      }
      
      override public function addItem(param1:Object) : void
      {
         super.addItem(param1);
         height = Math.min(this.length,4) * 20 + 10;
      }
      
      override public function set width(param1:Number) : void
      {
         this.var_3701.x = param1 - 30;
         super.width = param1;
      }
      
      override protected function draw() : void
      {
         super.draw();
         list.setSize(this.listBg.width,this.listBg.height - 7);
         list.invalidate();
      }
      
      public function get length() : Number
      {
         return var_1347.length;
      }
      
      public function name_3491() : void
      {
         var _loc1_:* = null;
         var _loc2_:SharedObject = null;
         clear();
         var _loc3_:SharedObject = storageService.getAccountsStorage();
         var _loc4_:int = 0;
         for(_loc1_ in _loc3_.data)
         {
            if(Boolean(_loc3_.data[_loc1_].userHash))
            {
               this.addItem({
                  "gameName":_loc1_,
                  "rang":0,
                  "id":_loc4_++,
                  "data":_loc3_.data[_loc1_]
               });
            }
         }
         visible = _loc4_ > 0;
         _loc2_ = storageService.getStorage();
         if(Boolean(_loc2_.data.userName))
         {
            name_1962("gameName",_loc2_.data.userName);
         }
         else
         {
            name_1962("id",0);
         }
      }
   }
}
