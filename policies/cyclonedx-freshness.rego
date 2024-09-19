package freshness

import rego.v1

default limit := 30

limit := to_number(input.args.limit)

nanosecs_per_second = (1000 * 1000) * 1000

nanosecs_per_day = ((24 * 60) * 60) * nanosecs_per_second

maximum_age = limit * nanosecs_per_day

violations contains msg if {
    sbom_ns = time.parse_rfc3339_ns(input.metadata.timestamp)
    exceeding = time.now_ns() - (sbom_ns + maximum_age)
    exceeding > 0
    msg := sprintf("SBOM created at: %s which is too old (freshness limit set to %d days)", [input.metadata.timestamp, limit])
}