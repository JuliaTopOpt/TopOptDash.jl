# dummy type implementing the Data trait
struct DummyData{𝒟,𝒱} <: Data
  domain::𝒟
  values::𝒱
end

TopOptDash.domain(data::DummyData) = getfield(data, :domain)

function TopOptDash.values(data::DummyData, rank=nothing)
  domain = getfield(data, :domain)
  values = getfield(data, :values)
  r = isnothing(rank) ? paramdim(domain) : rank
  haskey(values, r) ? values[r] : nothing
end

TopOptDash.constructor(::Type{D}) where {D<:DummyData} = DummyData
