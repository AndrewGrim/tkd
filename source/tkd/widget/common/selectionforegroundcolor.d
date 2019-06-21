/**
 * SelectionForegroundColor module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.common.selectionforegroundcolor;

/**
 * These are common commands that apply to all widgets that have them injected.
 */
mixin template SelectionForegroundColor()
{
	import std.string;

	/**
	 * Set the selection background color of the widget.
	 *
	 * Params:
	 *     color = The name of the color, e.g. 'black' or a hex value, e.g. '#000000'.
	 *
	 * Returns:
	 *     This widget to aid method chaining.
	 *
	 * See_Also:
	 *     $(LINK2 ../../element/color.html, tkd.element.color) for standard defined colors.
	 */
	public auto setSelectionForegroundColor(this T)(string color)
	{
		this._tk.eval("%s configure -selectforeground %s", this.id, color);

		return cast(T) this;
	}

	public string getSelectionForegroundColor()
	{
		this._tk.eval(format("%s cget -selectforeground", this.id));
		if (this._tk.getResult!(string).empty())
		{
			this._tk.eval(format("winfo selectforeground %s", this.id));
		}
		return this._tk.getResult!(string);
	}
}
