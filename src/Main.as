package 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Kurinkitos
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			polynomial = new Degree2Polynomial();
			//Setup the ui
			setupUi();
			button.addEventListener(MouseEvent.CLICK, updatePolymonial);
		}
		private function updatePolymonial(e:MouseEvent):void {
			polynomial.setCoefficients(Number(aInputField.text), Number(bInputField.text), Number(cInputField.text));
			polynomialField.text = polynomial.toString();
			answerField.text = polynomial.solve();
			var txtFormat:TextFormat = new TextFormat;
			txtFormat.align = "center";
			polynomialField.setTextFormat(txtFormat);
			answerField.setTextFormat(txtFormat);
		}
		private function setupUi():void {
			setupInputfields();
			setupStaticLabels();
			setupButtons();
			setupPolynomialField();
			setupAnswerField();
		}
		private function setupPolynomialField():void {
			polynomialField = new TextField();
			
			polynomialField.width = 200;
			polynomialField.height = 30;
			polynomialField.x = 40;
			polynomialField.y = 5;
			polynomialField.border = true;
			
			polynomialField.text = "ax^2 + bx + c";
			var txtFormat:TextFormat = new TextFormat;
			txtFormat.align = "center";
			polynomialField.setTextFormat(txtFormat);
			
			addChild(polynomialField);
			
		}
		private function setupAnswerField():void {
			answerField = new TextField();
			
			answerField.width = 300;
			answerField.height = 30;
			answerField.x = 40;
			answerField.y = 50;
			answerField.border = true;
			
			var txtFormat:TextFormat = new TextFormat;
			txtFormat.align = "center";
			answerField.setTextFormat(txtFormat);
			
			addChild(answerField);
		}
		private function setupButtons():void {
			button = new SimpleButton();
			var down:Sprite = new Sprite();
			down.graphics.lineStyle(1, 0x000000);
			down.graphics.beginFill(0xFF0000);
			down.graphics.drawRect(10, 10, 50, 30);
			 
			var up:Sprite = new Sprite();
			up.graphics.lineStyle(1, 0x000000);
			up.graphics.beginFill(0x0000FF);
			up.graphics.drawRect(10, 10, 50, 30);
			
			var over:Sprite = new Sprite();
			over.graphics.lineStyle(1, 0x000000);
			over.graphics.beginFill(0x00ff00);
			over.graphics.drawRect(10, 10, 50, 30);
			 
			button.upState = up;
			button.overState = over;
			button.downState = down;
			button.useHandCursor = true;
			button.hitTestState = up;
			
			button.x = 250;
			button.y = 80;
			
			addChild(button);
			trace("Button created");
		}
		private function setupStaticLabels():void {
			aLabel = new TextField();
			bLabel = new TextField();
			cLabel = new TextField();
			
			aLabel.width = aInputField.width;
			bLabel.width = bInputField.width;
			cLabel.width = cInputField.width;
			aLabel.height = aInputField.height;
			bLabel.height = bInputField.height;
			cLabel.height = cInputField.height;
			aLabel.x = aInputField.x;
			bLabel.x = bInputField.x;
			cLabel.x = cInputField.x;
			aLabel.y = aInputField.y - aInputField.height;
			bLabel.y = bInputField.y - bInputField.height;
			cLabel.y = cInputField.y - cInputField.height;
			aLabel.text = "a";
			bLabel.text = "b";
			cLabel.text = "c";
			
			var txtFormat:TextFormat = new TextFormat;
			txtFormat.align = "center";
			aLabel.setTextFormat(txtFormat);
			bLabel.setTextFormat(txtFormat);
			cLabel.setTextFormat(txtFormat);
			
			addChild(aLabel);
			addChild(bLabel);
			addChild(cLabel);
		}
		private function setupInputfields():void {
			aInputField = new TextField();
			bInputField = new TextField();
			cInputField = new TextField();
			
			aInputField.type = "input";
			bInputField.type = "input";
			cInputField.type = "input";
			/*aInputField.restrict = "0123456789";
			bInputField.restrict = "0123456789";
			cInputField.restrict = "0123456789";*/
			aInputField.border = true;
			bInputField.border = true;
			cInputField.border = true;
			aInputField.width = 40;
			bInputField.width = 40;
			cInputField.width = 40;
			aInputField.height = 20;
			bInputField.height = 20;
			cInputField.height = 20;
			aInputField.x = 40;
			bInputField.x = 120;
			cInputField.x = 200;
			aInputField.y = 100;
			bInputField.y = 100;
			cInputField.y = 100;
			addChild(aInputField);
			addChild(bInputField);
			addChild(cInputField);
		}
		private var polynomial:Degree2Polynomial;
		//Ui variables
		private var aInputField:TextField;
		private var bInputField:TextField;
		private var cInputField:TextField;
		private var aLabel:TextField;
		private var bLabel:TextField;
		private var cLabel:TextField;
		private var polynomialField:TextField;
		private var answerField:TextField;
		private var button:SimpleButton;
	}
}