# SemanticSwap

Traditioal financial markets evloved around order books specific to two scalar units. Buyers and sellers get matched when they value these units the same relative to themselve (i.e. both accept one price).

All innovation in DeFi largely follows the same approach. While most exchanges retired the order book in favor of more innovative matching, they still facilitate trading for fungible tokens only.

We feel the approach of facilitating coordination through scalar units does not tap into the full potential modern ledgers have to offer. That's why we propose a semantic matching engine to facilitate trading of goods and services directly.

## How it works

A SemanticSwap exchange instance consists of a single generalized order book:

- Offers: (I am able to do someting)
- Asks (I want to have something done)

The key invention is to express those statements in IEML, the Information Economy MetaLanguage. IEML is a regular language with the expressive power of a natural language. This allows to be very precise with expressions. And more importantly, it is making those expressions computable so algorithms can automatically reason about things. This allows us to direct all our computing resources towards exploring the humongously large space of possible coordination, and look for the the ones we desire most. Humans wouldn't have the computational capacity to do that and they wouldn't like to do it anyways. This solution allows to split the work between humans and computers: Humans express what they want and computers tell us how to get there, verifiably.

## Merger DAO and Defi

Current governance structures for DAOs try to solve two distinct problems at once:

1. Deciding on what we want to happen
2. Figuring out how to get there

SemanticSwap is very focussed on the latter. Instead of using money for coodination it utilizes automatic reasoning. We foresee a non-monetary economy emerging here and propose a name change from _financial markets_ to _coordination markets_. Basically removing the abstraction of money and have a market directly for the coordination hiding behind it.

The first problem however is the mission of the DAO and governance movement. By seperating those two concerns all DAOs can now focus on figuring out what the comunity wants by utilizing various types of voting mechanisms and pooling of resources. Then that collective consensus about shared values can be expressed in IEML and forwarded to SemanticSwap. With that the whole DAO participates in the coordination market. SemanticSwap facilitates and optimizes the social coordinaton (matching of resources), both within the DAO and between the DAO and the external economies.

## Benefits over monetary economies

This approach to coordination (as opposed to monetary economies) unlocks a couple of things:

### Improved flow of information between buyer and seller

Market participants precisely express their asks and offers instead of putting up just a number. Price discovery can be skipped allowing for efficent matching even in what traditionally was considered illiquid markets (option products, ride sharing, brick and mortar stores).

### Cognitive load is taken care of by machines

Expressing all offers and asks in IEML allows us to have computing systems search the huge space of possible coordination as they are able to _understand_ the situation. There are no humans required to painstakinly figure out what to match with whom. They wouldn't be capable of finding highly efficient coordination proposals anyways due to the limited computational power and precision of human thought.

### Long term reduction of inequality

When goods and services are matched directly the need of pairwise transactions fade away. Pairwise transactions really are just two gifts in the opposite direction with instantaneous, debt-free settlement. This model of facilitating trade however hase inequaity fundamentally built in. Even through one of the two gifts aims to be of the same value as the other gift, mispricings are very real for various reasons (information asymetry, subjective value, price controls, emergencies). The sheer possibility of having mispriced goods introduces inequality even in perfectly equal systems which is then further reinforced by the compounding of capital over time.

Our matching engine solves that by getting rid of pairwise transactions and match a multitude of market participants at once. This is similar in the way bartering economies did not use money, but different in that the matching process is facilitated by a computer system and can span many market participants spread out accross space and time.

## Further Development

There is a lot of work to do after the hackathon in order to unfold the full potential of coordination markets.

- **Continuous matching:** Accept short term debt instead of using a fungible delta settlement.
- **Add a corpus of common knowledge** to verifiably account for constraints of shared reality.
- **On-chain, verifiable IEML reasoning:** Have an objective function to find the most optimal way of coordination.
- **Speculation:** Integrate first class prediction markets to allow speculators to predict the future. But in addition to state _what_ they think will happen speculators also need to commit _why_ it will happen in order to qualify for a payout. This enforces information sharing among market participants.
- **Enhance privacy:** Use a commit-reveal scheme together with zero knowledge Proof of Work variant.
- **Towards a shared computation:** Building a distributed operating system that allows for everyone to contribute with both their data and computational resources and become a market maker in the coordination market.
- **Introduce a dispute process:** Such a distributed operating system also is your attorney. It helps you to verifiably record all data you need to proof that you behaved correctly, just in case there is a dispute. Following that personal, automated attorney is your free insurance for legal battles
- **Coordination ASICs:** Build special purpose hardware to do zero knowledge semantic computing. **This is the device that allows you to mine social coordination.**
