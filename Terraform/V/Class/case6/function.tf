output "o1" {
    value = length([ "a", "b","c"])
} 
output "o2" {
    value = index([ "a", "b","c"],"b")
}

output "o3" {
    value = element([ "a", "b","c"],count.index)
}
