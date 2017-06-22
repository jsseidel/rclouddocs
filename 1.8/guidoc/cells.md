# Cells

There are two types of cells in RCloud. The first is the **prompt** cell, which allows you to interact with RCloud in more-or-less command-line fashion. Prompt cells are useful for quick, interactive sessions.

Prompt cells support R, Python, and Bash, which you can specify in the pull-down menu to the right of each cell:

![Prompt / Markdown Cell Selection](img/python.png)

The second type is the **markdown** cell. Markdown cells are better suited for cutting and pasting chunks of R code and adding simple formatted documentation. Note that Markdown cells do not currently support Python or Bash.

We'll get to the difference between Markdown and RMarkdown cells in a moment.

"Data marshalling," or using objects between cells of different languages, is not supported at this time. Also, each "shell" cell represents a separate Unix shell, so environment variables cannot be passed across shell cells. However, R environment variables defined in R cells are inherited by shell cells automatically. Shell cell commands are executed in Bash.



## Prompt cells

<a href="img/promptcell.png"><img class="trunc" src="img/promptcell.png" /></a>

Prompt cells mimic an interactive R, Python, or Bash shell. Type a line of code, press Enter/Return, and the command is immediately executed. When RCloud is finished, it presents the result and a new prompt cell.

For example, here's the result of pressing Enter/Return after typing a command:

![Prompt Cell Result](img/promptcellresult.png)

Note that after executing a command, RCloud presents several icons that allow you to interact with the cell: ![Run Cell](img/runmarkdown.png), ![Edit Cell](img/editmarkdown.png), ![Split Cell](img/splitmarkdown.png), and ![Delete Cell](img/deletecell.png):

* ![Run Cell](img/runmarkdown.png) Run the code in the cell.
* ![Edit Cell](img/editmarkdown.png) Edit the code in the cell (clicking on your code also enables editing).
* ![Split Cell](img/splitmarkdown.png) Split the cell into two parts at the cursor.
* ![Delete Cell](img/deletecell.png) Delete the cell.

Another way to interact in multi-line mode with prompt cells is to cut and paste multiple lines of code into the cell. When you do, you'll see something like this:

<a href="img/multilinerpromptpaste.png"><img class="trunc" src="img/multilinerpromptpaste.png" /></a>

To execute the code, simply put your cursor at the end of the last line and press Enter/Return.

Note that you cannot insert a prompt cell above an existing prompt cell. The only way to add new prompt cells is by executing the current prompt cell. When you do, a new cell is created under the existing one.



### Terminology

Throughout this documentation, prompt cells are sometimes referred to as R cells, Python cells, or Bash cells.



## Markdown cells

<a href="img/markdowncell.png"><img class="trunc" src="img/markdowncell.png" /></a>



### Adding Code

Markdown cells are where you enter and edit blocks of multi-line R markdown. Markdown is a plain-text formatting syntax used to create simple formatted documents. In order to differentiate your R code from text, surround your code with the following (back ticks, brackets and "r"):

    ```{r}
    ## R code goes here
    print("Hello World!")
    ```

For additional information about Markdown, please refer to the [full documentation of Markdown syntax](http://daringfireball.net/projects/markdown/syntax).

When you're done editing a markdown cell, click the ![Run Markdown](img/runmarkdown.png) icon to the right of the cell. Here is the result:

<a href="img/markdowncellresult.png"><img border="0" width="640" src="img/markdowncellresult.png" /></a>



## Editing and viewing results

If you find a typo or would like to otherwise edit your code, click the ![Edit Markdown](img/editmarkdown.png) icon. You can also click on any code portions of the output to enter edit mode.

### Navigation

At the beginning or end of a cell's code, use the up and down arrow keys to jump to the next or previous cell.



## Adding and deleting cells

To insert a cell above, click the ![Insert Cell: Example 1](img/addcell.png) icon. To insert a cell below, click the ![Insert Cell: Example 2](img/addcellbelow.png) icon. To delete a cell altogether, click the ![Delete Cell](img/deletecell.png) icon.



## Cell run-state indicator

The run state of each cell is displayed via an icon in between the gutter and cell name:

![Cell Run-state Indicator: Open Circle](img/opencircle.png): The cell has not been run. This could also mean that the cell ran successfully, but the output may not be consistent with the code in the cell because the code was modified after RCloud initiated a run of your notebook.

![Cell Run-state Indicator: Blue Arrow](img/bluearrow.png): The cell is queued to be run.

![Cell Run-state Indicator: Running Question1](img/cellstatequestion1.png): RCloud initiated a run of your notebook, but a cell's code was modified after execution was initiated.

![Cell Run-state Indicator: Running Circle](img/runningcircle.png): The cell is running.

![Cell Run-state Indicator: Running Question2](img/cellstatequestion2.png): The cell is running, but because the code was modified after notebook execution was initiated, the output may not be consistent with the code.

![Cell Run-state Indicator: Green Circle](img/greencircle.png): The cell ran successfully.

![Cell Run-state Indicator: Exclamation Point](img/exclaim.png): The cell ran but had errors.

![Cell Run-state Indicator: Splat Circle](img/splatcircle.png): The cell's run was cancelled.



## Stopping cell execution

When you run a notebook, you can stop running cells and prevent queued cells from running by pressing the stop button, located in the header at the top of the screen:

![Nonpreemptive Stop Icon](img/stop.png)

This sends an interrupt to the R process and terminates execution if possible.

[Top](#top)

## Rearranging cells

To rearrange your cells, click and drag the blank status area above the cell or the ![Drag and Drop Cell Order Arrangement](img/dragcell.png) icon to the left of the cell.



## Joining cells

To join cells of the same flavor, click the join icon at the right of the cell. This will combine the contents of the cell with the cell immediately above it.

![Join Cells](img/join.png)

## Markdown versus RMarkdown cells

Behind the scenes, RCloud uses several different R packages to render output. Markdown cells use the [Markdown](http://cran.r-project.org/web/packages/markdown/index.html) and [knitr](http://yihui.name/knitr/) packages directly for output.  RMarkdown cells, on the other hand, use [rmarkdown](http://rmarkdown.rstudio.com/) (also known as R Markdown v2).

Currently, RMarkdown support should be considered experimental.



## Saving plots

Hover the mouse over a plot created in an R cell to make the disk icon appear in the upper right corner (see 1), which contains a list of available image formats. A widget at the lower-right corner can be used to resize the image (see 2).

<a href="img/saveresize.png"><img class="trunc" src="img/saveresize.png" /></a>

Note that you can only save plots created in R cells.



## Locators

RCloud supports the standard R [`locator()` function](https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/locator.html). When the locator is active, RCloud adds a blue border around the plot and changes the cursor to a crosshair:

<a href="img/locator.png"><img class="trunc" src="img/locator.png" /></a>

To add points, left click anywhere on the plot. To end or abort a locator request, press the `Esc` key. Once you have selected your locations, `locator()` returns the points clicked:

<a href="img/locator_res.png"><img class="trunc" src="img/locator_res.png" /></a>

Locators only work in R cells.



