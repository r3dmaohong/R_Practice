#https://blog.gtwang.org/r/r-strings-and-factors/4/

colors <- c("red", "yellow", "green", "red", "green")
colors.factor <- factor(colors)
colors.factor
levels(colors.factor)
nlevels(colors.factor)

#�ﶶ��
colors.factor2 <- factor(colors, levels = c("red", "yellow", "green"))
colors.factor2

#��W��
colors.factor3 <- factor(colors,
                         levels = c("red", "yellow", "green"),
                         labels = c("R", "Y", "G"))
colors.factor3

colors.levels <- levels(colors.factor)
levels(colors.factor) <- c(colors.levels, "blue")
colors.factor[1] <- "blue"
colors.factor

##�@��]�wlevel������
levels(colors.factor) <- list(
  blue = "blue", green = "green",
  red = "red", yellow = "yellow")
colors.factor[1] <- "blue"
colors.factor

#���s�ƧǦ]�l�ܼƪ� levels�A�N���w�� level ��b�Ĥ@�Ӧ�m
relevel(colors.factor, "red")

colors.raw <- c("Red", "yellow", "green", "red", "green")
colors.factor <- factor(colors.raw)
colors.factor

colors.factor[1] <- "red"
unique(colors.factor)

##����level
colors.factor <- droplevels(colors.factor)
colors.factor

##
##
##

choices <- c("worst", "bad", "so-so", "good", "perfect")
samples <- sample(choices, 10, replace = TRUE)
samples.factor <- factor(samples, levels = choices)
samples.factor

samples.ordered <- ordered(samples, levels = choices)
samples.ordered



##
##
##

raw <- data.frame(
  x = c("1.23", "4..56", "7.89")
)
as.numeric(raw$x) ##level��?
as.numeric(as.character(raw$x))
as.numeric(levels(raw$x))[as.integer(raw$x)]

##
##
##
##gl��ƨ̾ګ��w�˦��Ӳ��ͦ]�l�ܼơA�Ĥ@�ӰѼ� n �O���w�]�l�� level �ƥءA�ĤG�ӰѼ� k ���w�C�� level �X�{������
gl(n = 2, k = 8)
gl(n = 2, k = 8, labels = c("Control", "Treat"))
gl(n = 2, k = 2, length = 8,
   labels = c("Control", "Treat"))

a <- gl(2, 4, 8)
a
b <- gl(2, 2, 8, labels = c("ctrl", "treat"))
b
interaction(a, b)

s <- gl(2, 1, 8, labels = c("M", "F"))
s

interaction(a, b, s, sep = ":")