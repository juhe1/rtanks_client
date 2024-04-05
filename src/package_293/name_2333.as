package package_293
{
   import assets.icons.BattleInfoIcons;
   import controls.Label;
   import controls.resultassets.name_2332;
   
   public class name_2333 extends IconField
   {
      
      private static const const_2290:int = 9;
      
      private static const const_2291:int = 10;
      
      private static const const_2307:int = 9;
      
      private static const const_2304:int = 6;
      
      private static const const_1607:int = 18;
       
      
      private var var_1911:name_2332;
      
      public function name_2333(param1:int)
      {
         super(param1);
      }
      
      override protected function init() : void
      {
         this.var_1911 = new name_2332();
         addChild(this.var_1911);
         if(var_2269 > -1)
         {
            icon = new BattleInfoIcons();
            icon.type = var_2269;
            addChild(icon);
            icon.x = 9;
            icon.y = 10;
         }
         label = new Label();
         label.color = 16777215;
         addChild(label);
         if(Boolean(icon))
         {
            label.x = icon.x + icon.width + 9;
         }
         else
         {
            label.x = 9;
         }
         label.y = 6;
         label.size = 18;
         label.bold = true;
         this.score = 0;
      }
      
      public function set score(param1:int) : void
      {
         text = param1.toString();
         this.var_1911.width = label.x + label.width + 10;
      }
   }
}
