package forms.friends.list.renderer
{
   import controls.base.LabelBase;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import forms.friends.name_3475;
   import forms.name_1139;
   import package_1.Main;
   import package_31.PanelModel;
   import package_31.name_115;
   import package_390.name_1889;
   import package_481.RendererBackGroundAcceptedList;
   import package_482.name_3476;
   import package_54.name_102;
   
   public class FriendsAcceptedListRenderer extends CellRenderer
   {
      
      public static var localeService:name_102;
      
      public static const name_2570:int = 18;
      
      public static const const_2728:int = 195;
      
      private static var var_3534:Class = name_3479;
      
      private static var var_3533:BitmapData = Bitmap(new var_3534()).bitmapData;
      
      private static var var_3535:Class = name_3477;
      
      private static var var_3530:BitmapData = Bitmap(new var_3535()).bitmapData;
      
      private static var var_3536:Class = name_3478;
      
      private static var var_3532:BitmapData = Bitmap(new var_3536()).bitmapData;
      
      private static var var_3537:Class = name_3480;
      
      private static var var_3531:BitmapData = Bitmap(new var_3537()).bitmapData;
       
      
      private var var_3538:DisplayObject;
      
      private var var_3048:name_1889;
      
      private var var_3529:name_3476;
      
      private var var_3526:name_3475;
      
      private var var_3523:LabelBase;
      
      private var var_3524:Bitmap;
      
      private var var_3525:Bitmap;
      
      private var var_3539:Bitmap;
      
      private var var_3527:Bitmap;
      
      private var var_3528:Bitmap;
      
      public function FriendsAcceptedListRenderer()
      {
         super();
      }
      
      override public function set data(param1:Object) : void
      {
         _data = param1;
         mouseEnabled = true;
         mouseChildren = true;
         useHandCursor = false;
         buttonMode = false;
         this.var_3538 = this.method_2573(_data);
         var _loc2_:DisplayObject = new RendererBackGroundAcceptedList(param1.online);
         var _loc3_:DisplayObject = new RendererBackGroundAcceptedList(param1.online,param1.online);
         setStyle("upSkin",_loc2_);
         setStyle("downSkin",_loc2_);
         setStyle("overSkin",_loc2_);
         setStyle("selectedUpSkin",_loc3_);
         setStyle("selectedOverSkin",_loc3_);
         setStyle("selectedDownSkin",_loc3_);
      }
      
      private function method_2573(param1:Object) : Sprite
      {
         var _loc2_:Sprite = new Sprite();
         if(param1.id != null)
         {
            if(this.var_3539 == null)
            {
            }
            this.var_3048 = new name_1889(param1.uid);
            this.var_3048.inviteBattleEnable = param1.online;
            this.var_3048.x = 0;
            this.var_3048.y = 0;
            _loc2_.addChild(this.var_3048);
            if(Boolean(param1.isNew))
            {
               if(this.var_3048.online)
               {
                  if(this.var_3524 == null)
                  {
                     this.var_3524 = new Bitmap(var_3533);
                  }
                  this.var_3524.visible = true;
                  _loc2_.addChild(this.var_3524);
               }
               else
               {
                  if(this.var_3525 == null)
                  {
                     this.var_3525 = new Bitmap(var_3530);
                  }
                  this.var_3525.visible = true;
                  _loc2_.addChild(this.var_3525);
               }
               if(this.var_3523 == null)
               {
                  this.var_3523 = new LabelBase();
                  this.var_3523.text = "Новый";
                  this.var_3523.color = name_1139.name_1894;
                  this.var_3523.mouseEnabled = false;
               }
               this.var_3523.visible = true;
               this.var_3523.x = 223 - this.var_3523.width;
               this.var_3523.y = 0;
               _loc2_.addChild(this.var_3523);
               if(this.var_3524 != null)
               {
                  this.var_3524.x = this.var_3523.x - 7;
               }
               if(this.var_3525 != null)
               {
                  this.var_3525.x = this.var_3523.x - 7;
               }
            }
            else
            {
               if(this.var_3523 != null)
               {
                  this.var_3523.visible = false;
               }
               if(this.var_3524 != null)
               {
                  this.var_3524.visible = false;
               }
               if(this.var_3525 != null)
               {
                  this.var_3525.visible = false;
               }
            }
            if(this.var_3526 != null)
            {
               this.var_3526.removeEventListener(MouseEvent.CLICK,this.method_3165);
            }
            if(this.var_3526 == null)
            {
               this.var_3526 = new name_3475(name_3475.name_1007);
            }
            this.var_3526.visible = false;
            this.var_3526.x = 223 - this.var_3526.width;
            this.var_3526.y = 0;
            this.var_3526.addEventListener(MouseEvent.CLICK,this.method_3165,false,0,true);
            _loc2_.addChild(this.var_3526);
            if(this.var_3529 != null)
            {
               this.var_3529.method_1476();
            }
            this.var_3529 = new name_3476(param1.idb);
            _loc2_.addChild(this.var_3529);
            this.var_3529.x = 233;
            this.var_3527 = new Bitmap(var_3532);
            this.var_3527.y = 5;
            this.var_3527.visible = Boolean(param1.isSNFriend) && !param1.isNew;
            _loc2_.addChild(this.var_3527);
            this.var_3528 = new Bitmap(var_3531);
            this.var_3528.y = 5;
            this.var_3528.visible = Boolean(param1.isReferral) && !param1.isNew;
            _loc2_.addChild(this.var_3528);
            this.method_3166();
            this.method_2557();
            this.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
            this.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut,false,0,true);
         }
         return _loc2_;
      }
      
      private function method_3166() : void
      {
         if(this.var_3527.visible)
         {
            this.var_3527.x = 195 - (this.var_3527.width >> 1);
            if(this.var_3528.visible)
            {
               this.var_3528.x = this.var_3527.x - 15;
            }
         }
         else
         {
            this.var_3528.x = 195 - (this.var_3528.width >> 1);
         }
      }
      
      private function method_2557() : void
      {
         this.var_3048.name_2046(this.var_3048.online ? uint(uint(name_1139.name_1894)) : uint(uint(name_1139.name_2149)),true);
      }
      
      private function onRollOver(param1:MouseEvent) : void
      {
         this.var_3526.visible = true;
         if(Boolean(_data.isNew))
         {
            if(this.var_3523 != null)
            {
               this.var_3523.visible = false;
            }
            if(this.var_3048.online)
            {
               if(this.var_3524 != null)
               {
                  this.var_3524.visible = false;
               }
            }
            else if(this.var_3525 != null)
            {
               this.var_3525.visible = false;
            }
         }
         super.selected = true;
      }
      
      private function onRollOut(param1:MouseEvent) : void
      {
         this.var_3526.visible = false;
         if(Boolean(_data.isNew))
         {
            if(this.var_3523 != null)
            {
               this.var_3523.visible = true;
            }
            if(this.var_3048.online)
            {
               if(this.var_3524 != null)
               {
                  this.var_3524.visible = true;
               }
            }
            else if(this.var_3525 != null)
            {
               this.var_3525.visible = true;
            }
         }
         super.selected = false;
      }
      
      private function method_3165(param1:MouseEvent) : void
      {
         PanelModel(Main.osgi.getService(name_115)).showRemoveFriendDialog(this.var_3048.uid);
      }
      
      override public function set listData(param1:ListData) : void
      {
         _listData = param1;
         label = _listData.label;
         if(this.var_3538 != null)
         {
            setStyle("icon",this.var_3538);
         }
      }
      
      override protected function drawBackground() : void
      {
         var _loc1_:* = enabled ? mouseState : "disabled";
         if(selected)
         {
            _loc1_ = "selected" + _loc1_.substr(0,1).toUpperCase() + _loc1_.substr(1);
         }
         _loc1_ += "Skin";
         var _loc2_:DisplayObject = background;
         background = getDisplayObjectInstance(getStyleValue(_loc1_));
         addChildAt(background,0);
         if(_loc2_ != null && _loc2_ != background)
         {
            removeChild(_loc2_);
         }
      }
      
      override public function set selected(param1:Boolean) : void
      {
      }
   }
}
