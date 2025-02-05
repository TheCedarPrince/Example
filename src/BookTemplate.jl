module BookTemplate

using Reexport: @reexport
@reexport begin
using Books: build_all, gen
using DataFrames:
    DataFrame,
    filter!,
    filter,
    select!,
    select
end # @reexport

"""
    build()

This function is called during CI.
"""
function build()
    println("Building Example Book")
    # To avoid publishing broken websites.
    fail_on_error = true
    Books.gen(; fail_on_error)
    Books.build_all(; fail_on_error)
end

end # module

