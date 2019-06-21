/**
 * InsertColor module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.common.insertcolor;

/**
 * These are common commands that apply to all widgets that have them injected.
 */
mixin template InsertColor()
{
	import std.string;

	/**
	 * Set the insert cursor color of the widget.
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
    public auto setInsertColor(this T)(string color)
    {
        this._tk.eval("%s configure -insertbackground %s", this.id, color);

        return cast(T) this;
    }

	public string getInsertColor()
	{
		this._tk.eval(format("%s cget -insertbackground", this.id));
		if (this._tk.getResult!(string).empty())
		{
			this._tk.eval(format("winfo insertbackground %s", this.id));
		}
		return this._tk.getResult!(string);
	}
}
