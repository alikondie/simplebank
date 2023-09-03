package util

import (
	"math/rand"
	"strings"
	"time"
)

const alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

var r *rand.Rand

func init() {
	s := rand.NewSource(time.Now().UnixNano())
	r = rand.New(s)

}

// RandomInt generate a random integer between min and max
func RandomInt(min, max int64) int64 {

	return min + r.Int63n(max-min+1)
}

// RandomString generate a random string of length n
func RandomString(n int) string {
	var sb strings.Builder
	k := len(alphabet)

	for i := 0; i < n; i++ {
		c := alphabet[r.Intn(k)]
		sb.WriteByte(c)
	}

	return sb.String()
}

// RandomOwner generate a random owner name
func RandomOwner() string {
	return RandomString(6)
}

// RandomMoney generate a random amount of money
func RandomMoney() int64 {
	return RandomInt(0, 1000000)
}

// RandomCurrency generates a random currency
func RandomCurrency() string {
	currencies := []string{"EUR", "USD", "DZD"}

	n := len(currencies)
	return currencies[rand.Intn(n)]
}
