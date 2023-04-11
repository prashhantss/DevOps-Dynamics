output "length" {
    value = length([ "a", "b","c" ])
}


output "index" {
    value = index([ "a", "b","c"],"b")
}

output "element" {
    value = element([ "a", "b","c"], 1)
}
