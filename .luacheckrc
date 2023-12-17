max_comment_line_length = false
codes = true

exclude_files = {
  "tests/",
  ".luacheckrc",
}
-- https://luacheck.readthedocs.io/en/stable/warnings.html
-- 211	Unused local variable.
-- 212	Unused argument.
-- 213	Unused loop variable.
-- 214	Used variable.
-- 221	Local variable is accessed but never set.
-- 231	Local variable is set but never accessed.
-- 232	An argument is set but never accessed.
-- 233	Loop variable is set but never accessed.
-- 241	Local variable is mutated but never accessed.
-- 311	Value assigned to a local variable is unused.
ignore = {
  -- "2xx", -- variables (2xx)
  -- "3xx", -- values (3xx)
  "211", -- Unused local variable.
  "212", -- Unused argument
  "631", -- Line is too long
  "122", -- Setting a readonly global
}

read_globals = {
  "vim",
}

-- globals = { "U", "MxDebug", "MxDump" }
globals = { "log", "ddwrite", "ddwriteraw" }
