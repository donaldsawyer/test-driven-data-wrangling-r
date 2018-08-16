# verify that a string converts from dot notation to snake case
test.string.to.snake.dot.notation <- function()
{
  # given
  test.string <- "my.column"
  expected.string <- "my_column"
  
  # when
  new.string <- string.to.snake(test.string)
  
  # then
  checkEquals(expected.string, new.string)
}

# verify that a snake case string stays the same
test.string.to.snake.already.snake <- function()
{
  # given
  test.string <- "my_column"
  expected.string <- "my_column"
  
  # when
  new.string <- string.to.snake(test.string)
  
  # then
  checkEquals(expected.string, new.string)
}

# verify that a snake case with uppers becomes snake case lowers
test.string.to.snake.uppers <- function()
{
  # given
  test.string <- "MY_colUMN"
  expected.string <- "my_column"
  
  # when
  new.string <- string.to.snake(test.string)
  
  # then
  checkEquals(expected.string, new.string)
}

test.snake.case.one.column <- function()
{
  # given
  sut = c("col.one")
  expected.cols = c("col_one")
  
  # when
  new.cols <- columns.to.snake.case(sut)
  
  # then
  checkEquals(expected.cols, new.cols)
}

# verify that all columns get converted to snake case
test.snake.case.3.columns <- function()
{
  # given
  sut = c("col.one", "col.two", "col.three")
  expected.cols = c("col_one", "col_two", "col_three")
  
  # when
  new.cols <- columns.to.snake.case(sut)
  
  # then
  checkEquals(expected.cols, new.cols)
}

# verify that columns that are not dot notation stay the same
test.snake.case.3.columns.mixed <- function()
{
  # given
  sut = c("col.one", "col_two", "col.ThreE")
  expected.cols = c("col_one", "col_two", "col_three")
  
  # when
  new.cols <- columns.to.snake.case(sut)
  
  # then
  checkEquals(expected.cols, new.cols)
}