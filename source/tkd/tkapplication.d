/**
 * TkApplication module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.tkapplication;

/**
 * Private imports.
 */
import tkd.interpreter.tk;

/**
 * Public imports.
 */
public import tkd.element.element;
public import tkd.element.widget.button;
public import tkd.element.widget.frame;

/**
 * Base class of all Tk gui applications.
 */
abstract class TkApplication
{
	/**
	 * The Tk interpreter.
	 */
	private Tk _tk;

	/**
	 * constructor.
	 *
	 * Throws:
	 *     Exception if Tcl/Tk cannot be initialised.
	 */
	public this()
	{
		this._tk = Tk.getInstance();
		this.initInterface();
	}

	/**
	 * Run the application.
	 */
	public void run()
	{
		this._tk.run();
	}

	/**
	 * Exit the application.
	 */
	public void exit()
	{
		this._tk.eval("destroy .");
	}

	/**
	 * All element creation and layout should take place within this method.
	 * This method is called by the constructor to create the initial GUI.
	 */
	abstract protected void initInterface();
}
