package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.utils.LinksInterceptor;
   import controls.base.LabelBase;
   import flash.events.TextEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class ClanDescriptionText extends LabelBase
   {
       
      
      public function ClanDescriptionText()
      {
         super();
      }
      
      override public function set text(param1:String) : void
      {
         var _loc2_:LinksInterceptor = new LinksInterceptor(new Vector.<String>());
         var _loc3_:String = _loc2_.name_3342(param1);
         var _loc4_:Boolean = _loc2_.var_2193;
         if(_loc4_)
         {
            super.htmlText = _loc3_;
         }
         else
         {
            super.text = _loc3_;
         }
         correctCursorBehaviour = false;
         selectable = true;
         addEventListener(TextEvent.LINK,this.method_2397);
      }
      
      private function method_2397(param1:TextEvent) : void
      {
         var _loc2_:String = param1.text;
         navigateToURL(new URLRequest(_loc2_),"_blank");
      }
   }
}
