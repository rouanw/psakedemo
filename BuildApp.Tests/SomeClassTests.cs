using System;
using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BuildApp.Tests
{
    [TestClass]
    public class SomeClassTests
    {
        [TestMethod]
        public void ItIsTrue()
        {
            true.Should().BeTrue("Cause I said so");
        }
    }
}
