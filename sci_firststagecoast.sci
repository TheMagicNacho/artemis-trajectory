function [tree] = sci_firststagecoast(tree)
// Generated by M2SCI
// Conversion function for Matlab firststagecoast
// Input: tree = Matlab funcall tree
// Output: tree = Scilab equivalent for tree

tree=Funcall("exec",1,Rhs_tlist(tree.name),tree.lhs)
endfunction