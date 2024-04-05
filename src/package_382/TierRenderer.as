package package_382
{
   import alternativa.osgi.OSGi;
   import controls.Label;
   import fl.controls.listClasses.CellRenderer;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import forms.name_1139;
   import package_104.name_330;
   import package_54.name_102;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.fp10.libraries.name_390;
   
   public class TierRenderer extends CellRenderer
   {
      
      public static var localeService:name_102 = OSGi.getInstance().name_6(name_102) as name_102;
      
      private static const const_2895:Class = name_3692;
      
      private static const const_2888:BitmapData = new const_2895().bitmapData;
      
      private static const const_2889:Class = name_3688;
      
      private static const const_2887:BitmapData = new const_2889().bitmapData;
      
      private static const const_2900:Class = name_3690;
      
      private static const const_2901:BitmapData = new const_2900().bitmapData;
      
      private static const const_2893:Class = name_3694;
      
      private static const const_2890:BitmapData = new const_2893().bitmapData;
      
      private static const const_2896:Class = name_3693;
      
      private static const const_2897:BitmapData = new const_2896().bitmapData;
      
      private static const const_2903:Class = name_3695;
      
      private static const const_2899:BitmapData = new const_2903().bitmapData;
      
      private static const const_2902:Class = name_3689;
      
      private static const const_2906:BitmapData = new const_2902().bitmapData;
      
      private static const const_2905:Class = name_3691;
      
      private static const const_2898:BitmapData = new const_2905().bitmapData;
      
      private static const const_2892:Class = name_3696;
      
      private static const const_2891:BitmapData = new const_2892().bitmapData;
      
      private static const const_2904:Class = name_3687;
      
      private static const const_2894:BitmapData = new const_2904().bitmapData;
       
      
      private var var_3733:int = 5;
      
      private var var_3726:Bitmap;
      
      private var var_3632:Label;
      
      private var var_3729:Bitmap;
      
      private var var_3730:Bitmap;
      
      private var var_3727:Bitmap;
      
      private var var_3728:Bitmap;
      
      private var var_3732:Bitmap;
      
      private var var_3731:Bitmap;
      
      private var var_3723:*;
      
      private var var_3722:*;
      
      private var var_3724:*;
      
      private var var_3725:*;
      
      private var var_3720:Bitmap;
      
      private var var_3721:Bitmap;
      
      public function TierRenderer()
      {
         this.var_3726 = new Bitmap();
         this.var_3632 = new Label();
         this.var_3729 = new Bitmap();
         this.var_3730 = new Bitmap();
         this.var_3727 = new Bitmap();
         this.var_3728 = new Bitmap();
         this.var_3732 = new Bitmap();
         this.var_3731 = new Bitmap();
         this.var_3723 = new Label();
         this.var_3722 = new Label();
         this.var_3724 = new Label();
         this.var_3725 = new Label();
         this.var_3720 = new Bitmap(const_2901);
         this.var_3721 = new Bitmap(const_2890);
         super();
         addChild(this.var_3726);
         this.method_3314();
         this.method_3316();
      }
      
      private function method_3314() : void
      {
         this.var_3720.x = 3;
         this.var_3720.y = 40;
         addChild(this.var_3720);
         addChild(this.var_3732);
         this.var_3723.size = 12;
         this.var_3723.bold = true;
         this.var_3723.color = 9285998;
         this.var_3723.x = this.var_3720.x + 3;
         this.var_3723.y = this.var_3720.y + 3;
         this.var_3723.wordWrap = true;
         this.var_3723.multiline = true;
         addChild(this.var_3723);
         this.var_3724.size = 16;
         this.var_3724.bold = true;
         this.var_3724.color = 9285998;
         this.var_3724.x = this.var_3723.x;
         this.var_3724.y = this.var_3720.y + this.var_3720.height - 25;
         addChild(this.var_3724);
         this.var_3729.x = this.var_3720.x;
         this.var_3729.y = this.var_3720.y;
         addChild(this.var_3729);
         this.var_3727.x = this.var_3720.x + this.var_3720.width - 20;
         this.var_3727.y = this.var_3720.y + 5;
         addChild(this.var_3727);
         this.var_3723.width = this.var_3727.x - this.var_3723.x - 3;
      }
      
      private function method_3316() : void
      {
         this.var_3721.x = this.var_3720.x;
         this.var_3721.y = this.var_3720.y + this.var_3720.height + 3;
         addChild(this.var_3721);
         addChild(this.var_3731);
         this.var_3722.size = 12;
         this.var_3722.bold = true;
         this.var_3722.color = 16772787;
         this.var_3722.x = this.var_3721.x + 3;
         this.var_3722.y = this.var_3721.y + 3;
         this.var_3722.wordWrap = true;
         this.var_3722.multiline = true;
         addChild(this.var_3722);
         this.var_3725.size = 16;
         this.var_3725.bold = true;
         this.var_3725.color = 16772787;
         this.var_3725.x = this.var_3722.x;
         this.var_3725.y = this.var_3721.y + this.var_3721.height - 25;
         addChild(this.var_3725);
         this.var_3730.x = this.var_3721.x;
         this.var_3730.y = this.var_3721.y;
         addChild(this.var_3730);
         this.var_3728.x = this.var_3721.x + this.var_3721.width - 20;
         this.var_3728.y = this.var_3721.y + 5;
         addChild(this.var_3728);
         this.var_3722.width = this.var_3728.x - this.var_3722.x - 3;
         this.var_3632.size = 20;
         this.var_3632.y = 7;
         addChild(this.var_3632);
      }
      
      override public function set data(param1:Object) : void
      {
         var _loc2_:name_330 = null;
         var _loc3_:name_330 = null;
         _data = param1;
         this.var_3632.text = param1.number + " " + localeService.getText(name_390.const_1149);
         if(param1.state == TierList.const_2802)
         {
            this.var_3632.text += " [" + param1.progress + "%]";
            if(param1.progress != 100 && !param1.timer.running)
            {
               param1.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               param1.timer.start();
            }
         }
         this.var_3632.x = (const_2887.width - this.var_3632.width) / 2;
         this.method_3313(param1);
         if(param1.tier.freeItem != null)
         {
            _loc2_ = param1.tier.freeItem;
            this.setTitle(_loc2_.name,this.var_3723);
            this.setCount(_loc2_.amount,this.var_3724);
            this.name_1550(this.var_3732,this.var_3720,_loc2_.preview,0.85);
         }
         else
         {
            this.method_3312();
         }
         if(param1.tier.battlePassItem != null)
         {
            _loc3_ = param1.tier.battlePassItem;
            this.setTitle(_loc3_.name,this.var_3722);
            this.setCount(_loc3_.amount,this.var_3725);
            this.name_1550(this.var_3731,this.var_3721,_loc3_.preview,1);
         }
         else
         {
            this.method_3315();
         }
         this.method_3311(param1.tier.freeItem,this.var_3727,this.var_3729,const_2906,const_2891,const_2897);
         this.method_3311(param1.tier.battlePassItem,this.var_3728,this.var_3730,const_2898,const_2894,const_2899);
      }
      
      private function method_3313(param1:Object) : void
      {
         if(param1.state == TierList.const_2800)
         {
            this.var_3632.color = name_1139.name_2195;
            this.var_3726.bitmapData = const_2887;
         }
         else
         {
            this.var_3632.color = name_1139.name_1894;
            this.var_3726.bitmapData = const_2888;
         }
      }
      
      private function setTitle(param1:String, param2:Label) : void
      {
         param2.visible = true;
         param2.text = param1;
      }
      
      private function setCount(param1:int, param2:Label) : void
      {
         param2.visible = param1 > 1;
         param2.text = "x" + param1;
      }
      
      private function method_3312() : void
      {
         this.var_3723.visible = false;
         this.var_3724.visible = false;
         this.var_3732.bitmapData = null;
      }
      
      private function method_3315() : void
      {
         this.var_3722.visible = false;
         this.var_3725.visible = false;
         this.var_3731.bitmapData = null;
      }
      
      private function method_3311(param1:name_330, param2:Bitmap, param3:Bitmap, param4:BitmapData, param5:BitmapData, param6:BitmapData) : void
      {
         if(param1 == null)
         {
            param3.bitmapData = param6;
            param2.bitmapData = null;
            return;
         }
         if(param1.received)
         {
            param3.bitmapData = null;
            param2.bitmapData = param5;
         }
         else
         {
            param3.bitmapData = param6;
            param2.bitmapData = param4;
         }
      }
      
      private function name_1550(param1:Bitmap, param2:Bitmap, param3:ImageResource, param4:Number) : void
      {
         if(param3 != null && (!param3.isLazy || param3.isLoaded))
         {
            param1.bitmapData = param3.data;
            param1.width = int(param3.data.width * param4);
            param1.height = int(param3.data.height * param4);
            param1.x = this.var_3733 + (param2.width - param1.width) / 2;
            param1.y = param2.y + (param2.height - param1.height) / 2;
         }
      }
      
      private function onTimer(param1:Event) : *
      {
         if(_data.state == TierList.const_2802)
         {
            if(this.var_3726.bitmapData == const_2887)
            {
               this.var_3726.bitmapData = const_2888;
               this.var_3632.color = name_1139.name_1894;
            }
            else
            {
               this.var_3726.bitmapData = const_2887;
               this.var_3632.color = name_1139.name_2195;
            }
         }
      }
      
      override protected function drawBackground() : void
      {
      }
      
      override protected function drawLayout() : void
      {
      }
      
      override protected function drawIcon() : void
      {
      }
   }
}
